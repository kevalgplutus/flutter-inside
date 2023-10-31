import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inside/Constants/Constants.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              SvgPicture.asset('assets/images/logoonly.svg',
                  height: 100, width: 100, color: kPrimaryColors),
              const SizedBox(height: 25),
              Column(
                children: const [
                  Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Enter the email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  style: TextStyle(
                    fontSize: 14,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.45, 50),
                    primary: kPrimaryColors,
                    onPrimary: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: txtOTPSent,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: kPrimaryColors,
                        textColor: Colors.white,
                        fontSize: 20.0);
                  },
                  child: Text("Send OTP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
