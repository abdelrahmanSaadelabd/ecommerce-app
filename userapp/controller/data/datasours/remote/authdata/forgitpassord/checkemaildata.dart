import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Checkemaildata {
  Curd curd;
  Checkemaildata(this.curd);
  postdata(String email) async {
    var response = await curd.postData(appLink.checkemail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
