import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:signalr_core/signalr_core.dart';

class UserBController extends GetxController {
  late HubConnection hubConnection;
  Rx<LatLng?> currentLatLng = Rx<LatLng?>(null);
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    initSignalR();
  }

  Future<void> initSignalR() async {
    hubConnection = HubConnectionBuilder()
        .withUrl('https://raintor-api.devdata.top/hub')
        .build();

    hubConnection.on('ReceiveLatLon', (arguments) {
      if (arguments != null && arguments.length >= 2) {
        final double lat = arguments[0] as double;
        final double lon = arguments[1] as double;
        final newLatLng = LatLng(lat, lon);
        currentLatLng.value = newLatLng;

        mapController?.animateCamera(CameraUpdate.newLatLng(newLatLng));
      }
    });

    await hubConnection.start();

    // ✅ Ask User A for the latest lat/lon
    await hubConnection.send(methodName: 'RequestLastLocation');
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void onClose() {
    hubConnection.stop();
    super.onClose();
  }
}
