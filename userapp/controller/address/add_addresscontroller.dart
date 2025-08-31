import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/controller/address/address_controller.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/functions/handling_data.dart';
import 'package:untitled1/controller/core/services/myservices.dart';
import 'dart:convert';

import 'package:untitled1/controller/data/datasours/remote/address/addressdata.dart';

class AddAddresscontroller extends GetxController {
  Addressdata _addressdata = Addressdata(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController nameaddres;
  late StatusRequst statusRequst;
  LatLng? currentLocation;
  List address = [];
  List<LatLng> routePoints = [];
  double zoom = 15;

  String? selectedCity;
  String? selectedStreet;
  double? selectedLat;
  double? selectedLng;

  MapController mapController = MapController();
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    nameaddres = TextEditingController();
    statusRequst = StatusRequst.none;
    super.onInit();
    getCurrentLocation();
  }

  @override
  void onClose() {
    nameaddres.dispose();

    super.onClose();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled || permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition();
    currentLocation = LatLng(position.latitude, position.longitude);
    mapController.move(currentLocation!, zoom);
    await getAddressFromLatLng(currentLocation!);
    update(); // تحديث GetX
  }

  Future<void> searchLocation(String query) async {
    if (query.trim().isEmpty) return;

    final url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1';
    final response = await http.get(
      Uri.parse(url),
      headers: {'User-Agent': 'flutter_map_example'},
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        double lat = double.parse(data[0]['lat']);
        double lon = double.parse(data[0]['lon']);
        currentLocation = LatLng(lat, lon);
        mapController.move(currentLocation!, zoom);
        await getAddressFromLatLng(currentLocation!);
        update();
      }
    }
  }

  Future<void> getAddressFromLatLng(LatLng latLng) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=${latLng.latitude}&lon=${latLng.longitude}&format=json';
    final response = await http.get(
      Uri.parse(url),
      headers: {'User-Agent': 'flutter_map_example'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final address = data['address'];

      selectedCity =
          address['city'] ??
          address['town'] ??
          address['village'] ??
          "غير معروف";
      selectedStreet = address['road'] ?? "غير معروف";
      selectedLat = latLng.latitude;
      selectedLng = latLng.longitude;
      update();
    }
  }

  void updateZoom(bool zoomIn) {
    zoom += zoomIn ? 1 : -1;
    if (currentLocation != null) {
      mapController.move(currentLocation!, zoom);
    }
    update();
  }

  void onMapTap(LatLng point) {
    currentLocation = point;
    mapController.move(point, zoom);
    getAddressFromLatLng(point);
    update();
  }

  postData() async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await _addressdata.postdata(
      nameaddres.text,
      myServices.sharedPreferences.getString("id")!,
      selectedLat.toString(),
      selectedLng.toString(),
      selectedCity,
      selectedStreet,
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("status", "The effective address has been added.");
        Get.back();
        Get.find<AddressController>().address.clear();
        Get.find<AddressController>().getData();
      } else {
        Get.snackbar("erro", "this email or password is not correct");
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }
}
