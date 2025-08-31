import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Userdata {
  Curd curd;
  Userdata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.users}");
    var response = await curd.postData(appLink.users, {});
    return response.fold((l) => l, (r) => r);
  }

  getdatablock() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.userblocked}");
    var response = await curd.postData(appLink.userblocked, {});
    return response.fold((l) => l, (r) => r);
  }

  block(String userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.block}");
    var response = await curd.postData(appLink.block, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  unblock(String userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.unblock}");
    var response = await curd.postData(appLink.unblock, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  delet(String userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.delet}");
    var response = await curd.postData(appLink.delet, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  eidetuser(
    String userid,
    String username,
    String useremail,
    String userphone,
    String userpassword,
  ) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.eidet}");
    var response = await curd.postData(appLink.eidet, {
      "id": userid,
      "user_name": username,
      "user_email": useremail,
      "user_phone": userphone,
      "user_password": userpassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
