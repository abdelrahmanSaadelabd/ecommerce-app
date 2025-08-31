import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Singupdata {
  Curd curd;
  Singupdata(this.curd);
  postdata(String username, String passwoed, String email, String phone) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.singup}");
    var response = await curd.postData(appLink.singup, {
      "username": username,
      "password": passwoed,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
