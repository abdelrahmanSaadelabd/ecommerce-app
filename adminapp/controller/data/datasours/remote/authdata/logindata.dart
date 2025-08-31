import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Logindata {
  Curd curd;
  Logindata(this.curd);
  postdata(String passwoed, String email) async {
    var response = await curd.postData(appLink.login, {
      "password": passwoed,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
