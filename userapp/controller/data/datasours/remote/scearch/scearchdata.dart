import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Scearchdata {
  Curd curd;
  Scearchdata(this.curd);
  getdata(Scearch) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.scearch}");
    var response = await curd.postData(appLink.scearch, {"scearch": Scearch});
    return response.fold((l) => l, (r) => r);
  }
}
