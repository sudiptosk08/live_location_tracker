import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_location_tracker/app/user_a/controller/user_a_controller.dart';

class UserAPageView extends StatelessWidget {
  UserAPageView({super.key});

  final UserAController controller =
      Get.put(UserAController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User A - Sharing Location',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text('Location is being shared in real-time...'),
      ),
    );
  }
}
