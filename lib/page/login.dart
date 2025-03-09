import 'dart:async';

import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../utils/color_pool.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSignin = true;

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
            width: 375,
            height: 400,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorPool.backgroundColor1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      onPressed: () {
                        debugPrint(S.of(context).signin);
                        // 切换到登录
                        setState(() {
                          isSignin = true;
                        });
                      },
                      child: Text(
                        S.of(context).signin,
                        style: TextStyle(
                          color:
                              isSignin
                                  ? colorPool.secondaryColor1
                                  : colorPool.textPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: colorPool.borderColor1,
                      margin: EdgeInsets.only(left: 10, right: 10),
                    ),
                    TextButton(
                      onPressed: () {
                        debugPrint(S.of(context).signup);
                        // 切换到注册
                        setState(() {
                          isSignin = false;
                        });
                      },
                      child: Text(
                        S.of(context).signup,
                        style: TextStyle(
                          color:
                              isSignin
                                  ? colorPool.textPrimaryColor
                                  : colorPool.secondaryColor1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                isSignin ? SignIn() : SignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 账号
          TextField(
            decoration: InputDecoration(
              hintText: S.of(context).enteremail,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          // 密码
          TextField(
            decoration: InputDecoration(
              hintText: S.of(context).enterpassword,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          // 登录按钮
          GestureDetector(
            child: Container(
              width: 400,
              height: 70,
              decoration: BoxDecoration(
                color: colorPool.primaryColor1,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  S.of(context).signin,
                  style: TextStyle(
                    color: colorPool.textlightColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isSendVerifyCode = false;
  int _start = 60;
  late Timer _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          isSendVerifyCode = false;
          _start = 60;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 账号
          TextField(
            decoration: InputDecoration(
              hintText: S.of(context).enteremail,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          // 密码
          TextField(
            decoration: InputDecoration(
              hintText: S.of(context).enterpassword,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: S.of(context).enterverifycode,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          // 注册按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: colorPool.primaryColor1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).signup,
                      style: TextStyle(
                        color: colorPool.textlightColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap:
                    isSendVerifyCode
                        ? null
                        : () {
                          setState(() {
                            isSendVerifyCode = true;
                          });
                          startTimer();
                        },
                child: Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color:
                        isSendVerifyCode
                            ? colorPool.borderColor1
                            : colorPool.primaryColor1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      isSendVerifyCode
                          ? '$_start s'
                          : S.of(context).buttonVerify,
                      style: TextStyle(
                        color: colorPool.textlightColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
