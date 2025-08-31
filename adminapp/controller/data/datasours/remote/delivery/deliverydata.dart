import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Deliverydata {
  Curd curd;
  Deliverydata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.delivery}");
    var response = await curd.postData(appLink.delivery, {});
    return response.fold((l) => l, (r) => r);
  }

  getdatablock() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deliveryblocked}");
    var response = await curd.postData(appLink.deliveryblocked, {});
    return response.fold((l) => l, (r) => r);
  }

  getdapprovedelivery() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.approvedeliveries}");
    var response = await curd.postData(appLink.approvedeliveries, {});
    return response.fold((l) => l, (r) => r);
  }

  block(String deliveryid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deliveryblock}");
    var response = await curd.postData(appLink.deliveryblock, {
      "id": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  unblock(String deliveryid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deliveryunblock}");
    var response = await curd.postData(appLink.deliveryunblock, {
      "id": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  delet(String deliveryid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deliverydelet}");
    var response = await curd.postData(appLink.deliverydelet, {
      "id": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  aprove(String deliveryid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.approvedelivery}");
    var response = await curd.postData(appLink.approvedelivery, {
      "id": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }

  eidetdelivery(
    String deliveryid,
    String deliveryname,
    String deliveryemail,
    String deliveryphone,
    String deliverypassword,
  ) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deliveryeidet}");
    var response = await curd.postData(appLink.deliveryeidet, {
      "id": deliveryid,
      "delivery_name": deliveryname,
      "delivery_email": deliveryemail,
      "delivery_phone": deliveryphone,
      "delivery_password": deliverypassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
