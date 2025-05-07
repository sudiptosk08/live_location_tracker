import 'dart:async';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:signalr_core/signalr_core.dart';

class UserAController extends GetxController {
  late HubConnection hubConnection;
  Position? lastPosition;
  Timer? resendTimer;
  StreamSubscription<Position>? positionStream;

  @override
  void onInit() {
    super.onInit();
    initSignalR().then((_) {
      if (hubConnection.state == HubConnectionState.connected) {
        startLocationUpdates();
      }
    });
  }

  Future<void> initSignalR() async {
    hubConnection = HubConnectionBuilder()
        .withUrl('https://raintor-api.devdata.top/hub')
        .build();

    // ✅ Listen for location request
    hubConnection.on('RequestLastLocation', (_) {
      if (lastPosition != null) {
        sendLocation(lastPosition!.latitude, lastPosition!.longitude);
      }
    });

    await hubConnection.start();
  }

  Future<void> startLocationUpdates() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    // Cancel any previous stream
    positionStream?.cancel();

    // Start new position stream
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      lastPosition = position;
      sendLocation(position.latitude, position.longitude);
    });

    // Resend periodically (for late receivers)
    resendTimer?.cancel();
    resendTimer = Timer.periodic(Duration(seconds: 5), (_) {
      if (hubConnection.state == HubConnectionState.connected &&
          lastPosition != null) {
        sendLocation(lastPosition!.latitude, lastPosition!.longitude);
      }
    });
  }

  Future<void> sendLocation(double lat, double lon) async {
    try {
      await hubConnection.invoke('SendLatLon', args: [lat, lon]);
    } catch (e) {
      print("Failed to send location: $e");
    }
  }

  @override
  void onClose() {
    positionStream?.cancel();
    resendTimer?.cancel();
    hubConnection.stop();
    super.onClose();
  }
}
