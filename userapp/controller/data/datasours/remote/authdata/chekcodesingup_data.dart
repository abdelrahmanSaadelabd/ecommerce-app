import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class ChekcodesingupData {
  Curd curd;
  ChekcodesingupData(this.curd);
  postdata(String email, String code) async {
    var response = await curd.postData(appLink.checkcode, {
      "checkcode": code,
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }

  resendcode(String email) async {
    var response = await curd.postData(appLink.resendcode, {"email": email});

    return response.fold((l) => l, (r) => r);
  }
}
