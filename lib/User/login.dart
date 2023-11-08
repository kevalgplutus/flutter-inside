import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inside/Constants/Helpers.dart';
import 'package:inside/Home/HomeView.dart';
import 'package:inside/User/UserModel.dart';
import 'package:inside/User/forgot_password_view.dart';
import 'package:inside/Constants/Constants.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final dio = Dio();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisible = false;
  bool loading = false;

  String errorMessage = errEmptyEmail;
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Expanded(
          child: ListView(
            // shrinkWrap: true,
            children: [
              SvgPicture.asset(imgPathLogo,
                  height: 100, width: 100, color: kPrimaryColors),
              const SizedBox(
                  height: 25
              ),
              SizedBox(
                child: TextFormField (
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  autofocus: true,
                  controller: emailAddressController,
                  decoration: InputDecoration (
                    hintText: pHEmail,
                    border: OutlineInputBorder (
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  autocorrect: false,
                  autofocus: true,
                  controller: passwordController,
                  obscureText: (passwordVisible) ? false : true,
                  decoration: InputDecoration(
                      hintText: phPassword,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                                () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      )),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(txtForgotPassword),
                      style: TextButton.styleFrom(
                        primary: kPrimaryColors,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const ForgotPasswordView()),
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColors,
                        onPrimary: Colors.white,
                        elevation: 0,
                      ),
                      onPressed: () {
                        String strMessage = checkValidation().$1;
                        bool isValidate = checkValidation().$2;
                        if (isValidate) {
                          _sendRequestForLogin();
                        }
                        else {
                          Fluttertoast.showToast(
                              msg: strMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: kPrimaryColors,
                              textColor: Colors.white,
                              fontSize: 15.0);
                        }
                      },
                      child: Text(txtSignIn)
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    kCopyRight
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  (String, bool) checkValidation() {
    if (emailAddressController.text == '' ||
    emailAddressController.text == null) {
      return (errEmptyEmail, false);
    }
    else if (!regExp.hasMatch(emailAddressController.text)) {
      return (errInvalidEmail, false);
    }
    else if (passwordController.text == '' || passwordController.text == null) {
      return (errEmptyPassword, false);
    }
    else if (passwordController.text.characters.length < 6) {
      return (errInvalidPassword, false);
    }
    else {
      return ('Success!', true);
    }
  }

  /* API calling for login request */
  void _sendRequestForLogin() async {
    final response = await dio.post(kBaseURL + kAPIPath + kURILogin, data: {
      'email': emailAddressController.text,
      'password': passwordController.text,
    });

    UserModel model = UserModel.fromJson(response.data);
    Helpers.saveDataIntoSharedPrefference(model);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const HomeView()),
    );
  }

  @override
  void dispose() {
    emailAddressController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
