import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Resetpassworddata {
  Curd curd;
  Resetpassworddata(this.curd);
  postdata(String passwoed) async {
    var response = await curd.postData(appLink.resetpawword, {
      "password": passwoed,
    });
    return response.fold((l) => l, (r) => r);
  }
}
