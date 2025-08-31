import 'dart:io';

import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Itemsdata {
  Curd curd;
  Itemsdata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.viewitems}");
    var response = await curd.postData(appLink.viewitems, {});
    return response.fold((l) => l, (r) => r);
  }

  adddata(
    itemsname,
    image,
    desc,
    count,
    active,
    price,
    discount,
    cate,
    List<File> moreImages,
  ) async {
    print("📤 ADDING ITEM TO: ${appLink.additems}");

    var response = await curd.postRequestWithOptionalFiles(
      appLink.additems,
      {
        "items_name_ar": itemsname,
        "items_name": itemsname,
        "item_desc": desc,
        "items_desc_ar": desc,
        "items_count": count,
        "items_active": active,
        "items_price": price,
        "items_discount": discount,
        "items_cate": cate,
      },

      file: image, // ممكن تكون null
      fileFieldName: "items_image",
      extraFiles: moreImages,
      extraFieldName: "images[]",
    );

    return response.fold((l) => l, (r) => r);
  }

  eidetdata(
    itemsid,
    oldimage,
    oldimagelist,
    itemsname,
    newimage,
    desc,
    count,
    active,
    price,
    discount,
    List<File> moreImages,
    cate,
  ) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.eidetitems}");
    var response = await curd.postRequestWithOptionalFiles(
      appLink.eidetitems,
      {
        "id": itemsid,
        "oldimage": oldimage,
        "oldimagelist": oldimagelist,
        "items_name_ar": itemsname,
        "items_name": itemsname,
        "items_desc": desc,
        "items_desc_ar": desc,
        "items_count": count,
        "items_active": active,
        "items_price": price,
        "items_discount": discount,
        "items_cate": cate,
      },
      file: newimage, // ممكن تكون null
      fileFieldName: "items_image",
      extraFiles: moreImages,
      extraFieldName: "images[]",
    );

    return response.fold((l) => l, (r) => r);
  }

  deletdata(itemsgroyid, oldimage, oldimagelist) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deletitems}");
    var response = await curd.postData(appLink.deletitems, {
      "id": itemsgroyid,
      "oldimagelist": oldimagelist,
      "oldimage": oldimage,
    });
    return response.fold((l) => l, (r) => r);
  }
}
