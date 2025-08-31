import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:untitled1/controller/core/constant/colors.dart';
import 'package:untitled1/controller/core/functions/handling_data_view.dart';
import 'package:untitled1/controller/orders/ordersdetailscontroller.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    appColor appcolor = Get.put(appColor());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: appcolor.appbarcolor,
        title: Text(
          "orders",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: appcolor.iconcolor),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [appcolor.appbarcolor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GetBuilder<Ordersdetailscontroller>(
          init: Ordersdetailscontroller(),
          builder:
              (controller) => SafeArea(
                child: HandlingDataView(
                  statusRequst: controller.statusRequst,
                  widget: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            color: const Color.fromARGB(255, 255, 245, 226),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Name",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: appcolor.iconcolor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Price",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: appcolor.iconcolor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Count",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: appcolor.iconcolor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.orders.length,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  '${controller.orders[i]['items_name']}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  '${controller.orders[i]['items_price']}',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  '${controller.orders[i]['quantity']}',

                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "TotalPrice: \$${controller.totalprice}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: appcolor.appbarcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ...(controller.orders.isNotEmpty &&
                                  controller.orders[0]['address_name'] != null
                              ? [
                                SizedBox(height: 20),
                                Text(
                                  "#Address",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: appcolor.iconcolor,
                                  ),
                                ),
                                SizedBox(height: 20),

                                Card(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    245,
                                    226,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Name",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: appcolor.iconcolor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "City",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: appcolor.iconcolor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Street",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: appcolor.iconcolor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${controller.orders[0]['address_name']}',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                maxLines: 1,
                                                '${controller.orders[0]['city']}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                maxLines: 1,
                                                '${controller.orders[0]['street']}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 200,
                                    color: Colors.grey[300],
                                    child: GetBuilder<Ordersdetailscontroller>(
                                      init: Ordersdetailscontroller(),
                                      builder:
                                          (controller) => Stack(
                                            children: [
                                              FlutterMap(
                                                mapController:
                                                    controller.mapController,
                                                options: MapOptions(
                                                  center:
                                                      controller
                                                              .orders
                                                              .isNotEmpty
                                                          ? LatLng(
                                                            controller
                                                                .orders[0]['latitude'],
                                                            controller
                                                                .orders[0]['longitude'],
                                                          )
                                                          : LatLng(
                                                            30.0444,
                                                            31.2357,
                                                          ),
                                                  zoom: controller.zoom,
                                                  onTap: (tapPosition, point) {
                                                    controller.onMapTap(point);
                                                  },
                                                ),
                                                children: [
                                                  TileLayer(
                                                    urlTemplate:
                                                        "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=sY6eFY0HWxJaUQ8QkW3s",
                                                    tileProvider:
                                                        NetworkTileProvider(
                                                          headers: {
                                                            'User-Agent':
                                                                'YourAppName/1.0 (contact@example.com)',
                                                          },
                                                        ),
                                                  ),

                                                  if (controller
                                                          .currentLocation !=
                                                      null)
                                                    MarkerLayer(
                                                      markers: [
                                                        Marker(
                                                          point:
                                                              controller
                                                                  .currentLocation!,
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

                                              // ➕➖ أزرار الزوم
                                              Positioned(
                                                top: 70,
                                                right: 10,
                                                child: Column(
                                                  children: [
                                                    FloatingActionButton(
                                                      backgroundColor:
                                                          appcolor.iconcolor,
                                                      mini: true,
                                                      heroTag: 'zoomIn',
                                                      onPressed:
                                                          () => controller
                                                              .updateZoom(true),
                                                      child: const Icon(
                                                        Icons.add,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    FloatingActionButton(
                                                      backgroundColor:
                                                          appcolor.iconcolor,
                                                      mini: true,
                                                      heroTag: 'zoomOut',
                                                      onPressed:
                                                          () => controller
                                                              .updateZoom(
                                                                false,
                                                              ),
                                                      child: const Icon(
                                                        Icons.remove,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                    ),
                                  ),
                                ),
                              ]
                              : []),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
