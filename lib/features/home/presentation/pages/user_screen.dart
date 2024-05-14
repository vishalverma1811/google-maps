import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/features/home/presentation/controller/user_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserController userController = Get.put(UserController());
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final LatLng _center = const LatLng(-33.86, 151.20);
  @override
  void initState() {
    // TODO: implement initState
    userController.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Locations'),
      ),
      body: FutureBuilder(
        future: userController.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else {
            return Obx(() => GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: {
                for (int i = 0; i < userController.users.length; i++)
                  Marker(
                    markerId: MarkerId(userController.users[i].name!),
                    position: LatLng(
                      userController.users[i].address!.geo!.lat as double,
                      userController.users[i].address!.geo!.lng as double,
                    ),
                    icon: BitmapDescriptor.defaultMarker
                  ),
              },
            ));
          }
        },
      ),
    );
  }
}
