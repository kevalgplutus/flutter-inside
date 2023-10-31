import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inside/Home/HomeView.dart';
import 'package:inside/User/forgot_password_view.dart';
import 'package:inside/User/profile_view.dart';
import 'package:inside/Constants/Constants.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                SvgPicture.asset('assets/images/logoonly.svg',
                    height: 100, width: 100, color: kPrimaryColors),
                const SizedBox(height: 25),
                SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter the email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextField(
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
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ],
            ),
          ),
          Text(kCopyRight),
        ],
      ),
    );
  }
}
