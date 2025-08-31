import 'package:deliveryapp/controller/core/constant/colors.dart';
import 'package:deliveryapp/controller/core/services/myservices.dart';
import 'package:deliveryapp/controller/homecontroller/settingcontroller.dart';
import 'package:deliveryapp/linkapi/link_api.dart';
import 'package:deliveryapp/view/screen/home/setting/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    appColor appcolor = Get.put(appColor());
    Settingcontroller controller = Get.put(Settingcontroller());
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final cardColor = Colors.white.withOpacity(0.95);
    final shadow = [
      BoxShadow(
        color: Colors.black.withOpacity(0.07),
        blurRadius: 16,
        offset: Offset(0, 8),
      ),
    ];

    return Scaffold(
      backgroundColor: appcolor.appbarcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: appcolor.iconcolor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [appcolor.appbarcolor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.04),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(Profilescreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: width * 0.15,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(
                        "${appLink.imagenprofile}/${myServices.sharedPreferences.getString("deliveryimage")}",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "${myServices.sharedPreferences.getString("deliveryname")}",
                style: TextStyle(
                  fontSize: width * 0.055,
                  fontWeight: FontWeight.bold,
                  color: appcolor.iconcolor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "${myServices.sharedPreferences.getString("email")}",
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.grey[500],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: height * 0.03),
              Container(
                width: width * 0.92,
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: shadow,
                ),
                child: Column(
                  children: [
                    _modernTile(
                      icon: Icons.notifications_active_outlined,
                      color: Colors.amber[700],
                      title: "Notifications",
                      trailing: Switch(
                        value: true,
                        activeColor: appcolor.iconcolor,
                        onChanged: (v) {},
                      ),
                    ),
                    Divider(),
                    _modernTile(
                      icon: Icons.archive_outlined,
                      color: Colors.blue[400],
                      title: "Archiv",
                      onTap: () => Get.toNamed("/archiv"),
                    ),
                    Divider(),
                    _modernTile(
                      icon: Icons.contact_support_outlined,
                      color: Colors.green[400],
                      title: "About",
                    ),
                    Divider(),
                    _modernTile(
                      icon: Icons.contact_phone_outlined,
                      color: Colors.teal[400],
                      title: "Contact Us",
                      onTap: () async {
                        await launchUrl(Uri.parse("tel:01207273618"));
                      },
                    ),
                    Divider(),
                    _modernTile(
                      icon: Icons.login_rounded,
                      color: Colors.red[400],
                      title: "Logout",
                      onTap: () => controller.loguot(),
                      trailing: null,
                      titleStyle: TextStyle(
                        color: appcolor.appbarcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _modernTile({
  required IconData icon,
  required Color? color,
  required String title,
  VoidCallback? onTap,
  Widget? trailing,
  TextStyle? titleStyle,
}) {
  return ListTile(
    onTap: onTap,
    leading: Container(
      decoration: BoxDecoration(
        color: color?.withOpacity(0.13),
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(10),
      child: Icon(icon, color: color, size: 28),
    ),
    title: Text(
      title,
      style: titleStyle ?? TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ),
    trailing:
        trailing ??
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.grey[400],
        ),
    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
