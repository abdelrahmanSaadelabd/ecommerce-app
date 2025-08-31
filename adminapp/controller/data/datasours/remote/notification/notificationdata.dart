import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Notificationdata {
  Curd curd;
  Notificationdata(this.curd);
  getdata(userid) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.notification}");
    var response = await curd.postData(appLink.notification, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  pushnatification(email, title, body) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.pushnotification}");
    var response = await curd.postData(appLink.pushnotification, {
      "email": email,
      "title": title,
      "body": body,
    });
    return response.fold((l) => l, (r) => r);
  }
}
