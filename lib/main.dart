import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/page/signup.dart';
import 'package:frontend/utils/prefs.dart';
import 'package:frontend/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:toastification/toastification.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();

  final token = await Utils.getUserToken();

  if (token == null) {
    runApp(MyApp(isSignup: false));
  } else {
    runApp(MyApp(isSignup: true));
  }
}

class MyApp extends StatelessWidget {
  bool isSignup;

  MyApp({super.key, required this.isSignup});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ResponsiveBuilder(
        builder: (context, sizeInfomation) {
          Orientation orientation = MediaQuery.of(context).orientation;
          if (sizeInfomation.isDesktop || (sizeInfomation.isTablet && orientation == Orientation.landscape)){
            // 横板页面
            return MaterialApp(
              title: 'LearnX',
              supportedLocales: [
                const Locale('en', ''),
                ...S.delegate.supportedLocales
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                S.delegate],

              home: isSignup ? Container() : SignUp(),
            );
          }else {
            // 竖版页面
            return MaterialApp(
              title: 'LearnX',
              home: isSignup ? Container() : SignUp(),
            );
          }
        },
      ),
    );
  }
}
