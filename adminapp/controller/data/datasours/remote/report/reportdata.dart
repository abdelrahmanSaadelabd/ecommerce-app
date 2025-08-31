import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Reportdata {
  Curd curd;
  Reportdata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.report}");
    var response = await curd.postData(appLink.report, {});
    return response.fold((l) => l, (r) => r);
  }
}
