import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class TestData {
  Curd curd;
  TestData(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.singup}");
    var response = await curd.postData(appLink.singup, {});
    return response.fold((l) => l, (r) => r);
  }
}
