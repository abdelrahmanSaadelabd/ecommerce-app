import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:untitled1/controller/address/add_addresscontroller.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/view/widget/address/popupaddresname.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return GetBuilder<AddAddresscontroller>(
          init: AddAddresscontroller(),
          builder: (controller) {
            return Scaffold(
              resizeToAvoidBottomInset: false,

              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                backgroundColor: appcolor.appbarcolor,
                elevation: 0,
              ),
              body: Stack(
                children: [
                  FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      center:
                          controller.currentLocation ??
                          LatLng(30.0444, 31.2357),
                      zoom: controller.zoom,
                      onTap: (tapPosition, point) {
                        controller.onMapTap(point);
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=sY6eFY0HWxJaUQ8QkW3s",
                        tileProvider: NetworkTileProvider(
                          headers: {
                            'User-Agent':
                                'YourAppName/1.0 (contact@example.com)',
                          },
                        ),
                      ),
                      if (controller.currentLocation != null)
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: controller.currentLocation!,
                              width: 80,
                              height: 80,
                              child: const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                  // 🔍 مربع البحث
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 70,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: TextField(
                        controller: controller.searchController,
                        onSubmitted: controller.searchLocation,
                        decoration: const InputDecoration(
                          hintText: "Screach",
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),

                  // ✅ زر التأكيد
                  Positioned(
                    top: height * .75,
                    right: width * .28,
                    child: InkWell(
                      onTap: () {
                        if (controller.nameaddres.text.trim().isEmpty) {
                          showDialog(
                            context: context,
                            builder:
                                (_) => Popupaddresname(
                                  controllertext: controller.nameaddres,
                                ),
                          );
                        } else {
                          controller.postData();
                          Get.back();
                        }
                      },
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: [
                              Color.fromARGB(255, 255, 212, 69),
                              Color.fromARGB(255, 255, 225, 127),
                              Color.fromARGB(255, 255, 222, 112),
                              Color.fromARGB(255, 255, 230, 149),
                            ],
                          ),
                        ),
                        child: Center(child: Text("Add to cart")),
                      ),
                    ),
                  ),

                  // ➕➖ أزرار الزوم
                  Positioned(
                    top: 70,
                    right: 10,
                    child: Column(
                      children: [
                        FloatingActionButton(
                          backgroundColor: appcolor.iconcolor,
                          mini: true,
                          heroTag: 'zoomIn',
                          onPressed: () => controller.updateZoom(true),
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(height: 8),
                        FloatingActionButton(
                          backgroundColor: appcolor.iconcolor,
                          mini: true,
                          heroTag: 'zoomOut',
                          onPressed: () => controller.updateZoom(false),
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
