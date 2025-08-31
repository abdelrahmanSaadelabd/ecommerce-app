import 'package:untitled1/controller/core/class/curd.dart';
import 'package:untitled1/linkapi/link_api.dart';

class Addressdata {
  Curd curd;
  Addressdata(this.curd);
  postdata(
    addressname,
    userid,
    addresslat,
    addresslong,
    addresscity,
    addressstreet,
  ) async {
    var response = await curd.postData(appLink.add_address, {
      "addressname": addressname,
      "addressuserid": userid,
      "addresslat": addresslat,
      "addresslong": addresslong,
      "addresscity": addresscity,
      "addressstreet": addressstreet,
    });
    return response.fold((l) => l, (r) => r);
  }

  getdata(userid) async {
    var response = await curd.postData(appLink.address, {
      "addressuserid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletdata(addressid) async {
    var response = await curd.postData(appLink.deletaddress, {
      "addressid": addressid,
    });
    return response.fold((l) => l, (r) => r);
  }

  eidetdata(addressname, addressid, addresscity, addressstreet) async {
    var response = await curd.postData(appLink.editaddress, {
      "addressname": addressname,

      "addresscity": addresscity,
      "addressstreet": addressstreet,
      "addressid": addressid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
