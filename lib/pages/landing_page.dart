import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/pages/main_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

const double blurFactor = 5.0;
const int popupDelay = 2;

class _LandingPageState extends State<LandingPage> {
  bool isAgree = false;
  String? passwordErr;
  String? usernameErr;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void resetErr() {
    setState(() {
      usernameErr = null;
      passwordErr = null;
    });
  }

  void handleLogin() {
    resetErr();
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty) {
      setState(() {
        usernameErr = 'Username cannot be empty';
      });
      return;
    }

    if (username.length < 5) {
      setState(() {
        usernameErr = 'Username must be at least 5 characters long';
      });
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username)) {
      setState(() {
        usernameErr = 'Username must contain only letters and numbers';
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        passwordErr = 'Password cannot be empty';
      });
      return;
    }

    if (password.length < 8) {
      setState(() {
        passwordErr = 'Password must be at least 8 characters long';
      });
      return;
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    setState(() {
      passwordErr = 'Password must contain at least one symbol';
    });
    return;
  }

    SnackBar snackBar = SnackBar(
        content: Text("You successfully logged in as $username"),
        duration: const Duration(seconds: popupDelay));

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );

    Future.delayed(const Duration(seconds: popupDelay), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainPage(username: username);
      }), (route) => false);
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        backgroundColor: DesignSystem.vmblue,
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: const AssetImage('assets/valorant-wallpaper.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.15),
                BlendMode.dstATop,
              ),
            )),
            child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: blurFactor, sigmaY: blurFactor),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: DesignSystem.px, vertical: DesignSystem.py),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        "vALodex",
                        style: TextStyle(
                            fontFamily: 'valorant',
                            fontSize: DesignSystem.textxl,
                            color: DesignSystem.vred),
                      )),
                      const SizedBox(
                        height: DesignSystem.gapl,
                      ),
                      TextField(
                        controller: usernameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          errorText: usernameErr,
                          hintText: "USERNAME",
                          labelText: "USERNAME",
                          iconColor: primaryColor,
                          suffixIcon: Icon(
                            Icons.person_outline,
                            color: primaryColor,
                          ),
                          labelStyle: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: DesignSystem.textsm,
                              fontWeight: FontWeight.bold),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: DesignSystem.gapm,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(
                            color: Colors.white, fontSize: DesignSystem.textsm),
                        decoration: InputDecoration(
                          errorText: passwordErr,
                          hintText: "PASSWORD",
                          labelText: "PASSWORD",
                          iconColor: primaryColor,
                          suffixIcon: Icon(
                            Icons.lock_outline,
                            color: primaryColor,
                          ),
                          labelStyle: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        dense: true,
                        activeColor: primaryColor,
                        checkColor: Colors.white,
                        title: const Text(
                          "Keep me logged in",
                          style: TextStyle(
                            fontSize: DesignSystem.textxs,
                            color: DesignSystem.vred,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        value: isAgree,
                        onChanged: (value) {
                          setState(() {
                            isAgree = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: DesignSystem.gapl,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  handleLogin();
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Play Now",
                                  style: TextStyle(
                                      fontFamily: 'bebas',
                                      fontSize: DesignSystem.textlg,
                                      color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}
