import 'package:deliveryapp/controller/core/class/statesr_requst.dart';
import 'package:deliveryapp/controller/core/functions/handling_data.dart';
import 'package:deliveryapp/controller/core/services/myservices.dart';
import 'package:deliveryapp/controller/data/datasours/remote/order/orderdetaildata.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class Ordersdetailscontroller extends GetxController {
  Orderdetaildata _Orderdetaildata = Orderdetaildata(Get.find());
  List orders = [];
  String? orderid;
  String? totalprice;
  late StatusRequst statusRequst;

  MyServices myServices = Get.find();
  LatLng? currentLocation;
  List address = [];
  List<LatLng> routePoints = [];
  double zoom = 15;

  MapController mapController = MapController();

  @override
  void onInit() {
    statusRequst = StatusRequst.none;

    final args = Get.arguments;
    orderid = args['ordersid'].toString();
    totalprice = args['totalprice'].toString();
    getData();
    getCurrentLocation();

    super.onInit();
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    orders.clear();
    update();
    var response = await _Orderdetaildata.getdata(orderid!);
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        orders.addAll(response['data']);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled || permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition();
    currentLocation = LatLng(
      orders.isNotEmpty && orders[0]['address_name'] != null
          ? (orders[0]['latitude'] ?? position.latitude)
          : position.latitude,
      orders.isNotEmpty && orders[0]['address_name'] != null
          ? (orders[0]['longitude'] ?? position.longitude)
          : position.longitude,
    );
    if (orders.isNotEmpty && orders[0]['address_name'] != null) {
      mapController.move(currentLocation!, zoom);
    }

    await getAddressFromLatLng(currentLocation!);
    update(); // تحديث GetX
  }

  Future<void> getAddressFromLatLng(LatLng latLng) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=${latLng.latitude}&lon=${latLng.longitude}&format=json';
    final response = await http.get(
      Uri.parse(url),
      headers: {'User-Agent': 'flutter_map_example'},
    );

    if (response.statusCode == 200) {
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
}
