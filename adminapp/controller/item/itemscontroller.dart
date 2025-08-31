import 'package:adminapp/controller/core/class/statesr_requst.dart';
import 'package:adminapp/controller/core/functions/handling_data.dart';
import 'package:adminapp/controller/core/services/myservices.dart';
import 'package:adminapp/controller/data/datasours/remote/itemsdata/itemsdata.dart';
import 'package:adminapp/view/screen/home/itmes/edietitems.dart';

import 'package:get/get.dart';

class itemscontroller extends GetxController {
  Itemsdata _itemsgroydata = Itemsdata(Get.find());
  List items = [];
  MyServices myServices = Get.find();
  late StatusRequst statusRequst;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    statusRequst = StatusRequst.loading;
    items.clear();
    update();
    var response = await _itemsgroydata.getdata();
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequst = StatusRequst.failer;
      }
    }
    update();
  }

  delet(itemsgroyid, oldimagelist, oldimage) async {
    update();
    var response = await _itemsgroydata.deletdata(
      itemsgroyid.toString(),
      oldimage,
      oldimagelist.toString(),
    );
    print("0000000000000000000000000000000$response");
    statusRequst = handlingdata(response);
    if (StatusRequst.succes == statusRequst) {
      if (response['status'] == "success") {
        getData();
      } else {
        Get.snackbar("Erro", "This itemsgroy is Blocked");
      }
    }
    update();
  }

  gotoeidet(item) {
    Get.to(
      Edietitems(),
      arguments: {
        "itemsgroyid": item["items_id"],
        "nameitems": item["items_name"],
        "oldimage": item["main_image"],
        "oldimagelist": item["extra_images"],
        "itemsdesc": item["items_desc"],
        "itemscount": item["items_count"].toString(),
        "itemsprice": item["items_price"].toString(),
        "itemsdiscount": item["items_discount"].toString(),
        "itemsactive": item["items_active"].toString(),
        "itemscate": item["items_cate"].toString(),
        "catenameselected": item["categories_name"] ?? "",
      },
    );
  }
}
