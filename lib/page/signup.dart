import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../utils/color_pool.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          // 渐变颜色
          gradient: LinearGradient(
            colors: [colorPool.primaryColor1, colorPool.backgroundColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            height: 500,
            decoration: BoxDecoration(
              color: colorPool.backgroundColor1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(onPressed: () {
                      debugPrint(S.of(context).signin);
                    }, child: Text(S.of(context).signin)),
                  ],
                ),
                TextButton(onPressed: (){
                  setState(() {
                    S.load(const Locale('en'));
                  });
                }, child: Text('切换为英文')),
                TextButton(onPressed: (){
                  setState(() {
                    S.load(const Locale('zh','CN'));
                  });
                }, child: Text('切换为中文')),
                TextButton(onPressed: (){
                  setState(() {
                    S.load(const Locale('ru','RU'));
                  });
                }, child: Text('切换为俄语'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
