import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/controller/core/class/statesr_requst.dart';
import 'package:untitled1/controller/core/constant/image.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequst statusRequst;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequst,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequst == StatusRequst.loading
        ? Center(child: LottieBuilder.asset(APPimage.loading))
        : statusRequst == StatusRequst.delivery
        ? Center(child: LottieBuilder.asset(APPimage.dilevreANIMT))
        : statusRequst == StatusRequst.bascket
        ? Center(child: LottieBuilder.asset(APPimage.bascakt))
        : statusRequst == StatusRequst.serverfailer
        ? Center(child: LottieBuilder.asset(APPimage.serverfailer))
        : statusRequst == StatusRequst.succes
        ? widget // ✅ بدل ما كانت الأنيميشن خليها تعرض البيانات
        : statusRequst == StatusRequst.offlinefailers
        ? Align(
          alignment: Alignment.center,
          child: LottieBuilder.asset(
            APPimage.internet,
            height: 190,
            width: 190,
          ),
        )
        : statusRequst == StatusRequst.failer
        ? Center(
          child: Column(
            children: [
              LottieBuilder.asset(APPimage.nodata, height: 190, width: 190),
              Text(
                "Dont Found Data",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Colors.amber),
              ),
            ],
          ),
        )
        : widget;
  }
}

class handlingRqust extends StatelessWidget {
  final StatusRequst statusRequst;
  final Widget widget;
  const handlingRqust({
    super.key,
    required this.statusRequst,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequst == StatusRequst.loading
        ? Center(
          child: LottieBuilder.asset(
            APPimage.sendcode,
            height: 250,
            width: 250,
          ),
        )
        : statusRequst == StatusRequst.serverfailer
        ? Center(
          child: LottieBuilder.asset(
            APPimage.serverfailer,
            height: 190,
            width: 190,
          ),
        )
        : statusRequst == StatusRequst.succes
        ? Center(
          child: LottieBuilder.asset(
            APPimage.background,
            height: 190,
            width: 190,
          ),
        )
        : statusRequst == StatusRequst.delivery
        ? Center(
          child: LottieBuilder.asset(
            APPimage.dilevreANIMT,
            height: 190,
            width: 190,
          ),
        )
        : statusRequst == StatusRequst.offlinefailers
        ? Center(
          child: Column(
            children: [
              LottieBuilder.asset(APPimage.internet, height: 190, width: 190),
              Text("you not conact internet"),
            ],
          ),
        )
        : widget;
  }
}
