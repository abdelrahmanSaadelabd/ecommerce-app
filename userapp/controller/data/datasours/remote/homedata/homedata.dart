import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class homeeData {
  Curd curd;
  homeeData(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.home}");
    var response = await curd.postData(appLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  topselling() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.topselling}");
    var response = await curd.postData(appLink.topselling, {});
    return response.fold((l) => l, (r) => r);
  }
}
