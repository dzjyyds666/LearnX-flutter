import 'package:LearnX/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';

import 'constant.dart';

class Utils {
  static Future<String?> getUserToken() async {
    final token = Prefs.instance.prefs.getString(Constant.Token);
    return token;
  }

  static void showToast(String msg, Color bgColor, IconData icon) {
    // toast的详细使用参考pub.dev
    // https://pub.dev/packages/toastification
    toastification.show(
      title: Text(msg, style: TextStyle(color: Colors.black)),
      style: ToastificationStyle.flat,
      autoCloseDuration: Duration(seconds: 2),
      backgroundColor: bgColor.withOpacity(0.2),
      borderSide: BorderSide(color: bgColor),
      icon: Icon(icon, color: Colors.black, size: 20),
      showProgressBar: false,
    );
  }
}
