import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Archivorderdata {
  Curd curd;
  Archivorderdata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.archive}");
    var response = await curd.postData(appLink.archive, {});
    return response.fold((l) => l, (r) => r);
  }
}
