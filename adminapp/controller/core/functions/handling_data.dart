import 'package:adminapp/controller/core/class/statesr_requst.dart';

handlingdata(response) {
  if (response is StatusRequst) {
    return response;
  } else {
    return StatusRequst.succes;
  }
}
