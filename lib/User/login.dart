import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inside/Home/HomeView.dart';
import 'package:inside/User/forgot_password_view.dart';
import 'package:inside/User/profile_view.dart';
import 'package:inside/Constants/Constants.dart';
import '../Leaves/Filter/FilterView.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _validate = false;
  String errorMessage = errEmptyEmail;
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Form(
                key: _formKey1,
                child: ListView(
                  children: [
                    SvgPicture.asset('assets/images/logoonly.svg',
                        height: 100, width: 100, color: kPrimaryColors),
                    const SizedBox(height: 25),
                    SizedBox(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == '' || value == null) {
                            return errEmptyEmail;
                          } else if (!regExp.hasMatch(value)) {
                            return errInvalidEmail;
                          } else {
                             _validate = true;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter the email",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPasswordView()),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()),
                            // MaterialPageRoute(builder: (context) => const HomeView()),
                          );
                        },
                        child: Text("Sign In"),
                      )
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('OR'),
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
                        decoration: InputDecoration(
                            hintText: "Enter the Password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        validator: (value) {
                          _validate = checkValidation(value, false) as bool;
                          errorMessage = checkValidation(value, false) as String;
                          return errorMessage;
                        },
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
                            child: Text("Forgot Password?"),
                            style: TextButton.styleFrom(
                              primary: kPrimaryColors,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                // MaterialPageRoute(builder: (context) => const ForgotPasswordView()),
                                // MaterialPageRoute(builder: (context) => const ResetPasswordView()),
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordView()),
                              );
                            },
                          ),
                          ElevatedButton(
                            child: Text("Sign In"),
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColors,
                              onPrimary: Colors.white,
                              elevation: 0,
                            ),
                            onPressed: () {
                              if (_validate == false) {
                                Fluttertoast.showToast(
                                    msg: errorMessage,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: kPrimaryColors,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                              }
                              else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeView()),
                                  // MaterialPageRoute(builder: (context) => const HomeView()),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(kCopyRight),
          ],
        ),
      ),
    );
  }

  Future<(bool, String)> checkValidation(String? str, bool forEmail) async {
    if (forEmail == false) {
      if (str == '' || str == null) {
        return (false, errEmptyPassword);
      } else if (str.characters.length < 6) {
        return (false, errInvalidPassword);
      } else {
        return (true, '');
      }
    } else {
      if (str == '' || str == null) {
        return (false, errEmptyEmail);
      } else if (regExp.hasMatch(str)) {
        return (false, errInvalidEmail);
      } else {
        return (true, '');
      }
    }
  }
}
