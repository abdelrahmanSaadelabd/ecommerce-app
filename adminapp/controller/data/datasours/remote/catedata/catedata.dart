import 'package:adminapp/controller/core/class/curd.dart';
import 'package:adminapp/linkapi/link_api.dart';

class Catedata {
  Curd curd;
  Catedata(this.curd);
  getdata() async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.viewcate}");
    var response = await curd.postData(appLink.viewcate, {});
    return response.fold((l) => l, (r) => r);
  }

  adddata(catename, image) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.addcate}");
    var response = await curd.postRequestWithFile(
      appLink.addcate,
      {"catename": catename, "catenamear": catename},
      image,
      "cateimage",
    );
    return response.fold((l) => l, (r) => r);
  }

  eidetdata(categroyid, oldimage, catename, image) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.eidetcate}");
    var response = await curd.postRequestWithFile(
      appLink.eidetcate,
      {
        "id": categroyid,
        "oldimage": oldimage,
        "catenamear": catename,
        "catename": catename,
      },
      image,
      "cateimage",
    );
    return response.fold((l) => l, (r) => r);
  }

  deletdata(categroyid, oldimage) async {
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkk${appLink.deletcate}");
    var response = await curd.postData(appLink.deletcate, {
      "id": categroyid,
      "imagename": oldimage,
    });
    return response.fold((l) => l, (r) => r);
  }
}
