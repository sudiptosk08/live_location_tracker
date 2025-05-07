import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_location_tracker/app/user_b/controller/user_b_controller.dart';
class UserBPageView extends StatelessWidget {
  const UserBPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBController controller = Get.put(UserBController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User B - Receiving Location',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        final latLng = controller.currentLatLng.value;
        if (latLng == null) {
          return const Center(child: Text('Waiting for location updates...'));
        }
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: latLng,
            zoom: 16,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('userA'),
              position: latLng,
            ),
          },
          onMapCreated: controller.setMapController,
        );
      }),
    );
  }
}
