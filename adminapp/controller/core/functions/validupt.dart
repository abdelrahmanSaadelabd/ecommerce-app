import 'package:get/get.dart';

validupt(String val, int min, int mix, String typ) {
  if (typ == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid username";
    }
  }
  if (typ == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }
  if (typ == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone";
    }
  }
  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > mix) {
    return "can't be lager than $mix";
  }
}
