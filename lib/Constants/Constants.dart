import 'package:flutter/material.dart';

/*
Constant File to get the things easily changed throughout the app
 */


const kPrimaryColors = Colors.indigo;
const kCopyRight = "© 2023 Plutus Technologies Pvt.Ltd.";

const kBaseURL = "https://inside2.plutustec.com";
const kAPIPath = "/api/v1/emp";
const kURILogin = "https://inside2.plutustec.com/api/v1/emp/login";

const txtOTPSent = "OTP sent successfully to your registered mobile number!";
// Login Validation messages
const errEmptyEmail = 'Please enter the email';
const errInvalidEmail = 'Please enter the valid email';
const errEmptyPassword = 'Please enter the password';
const errInvalidPassword = 'Please enter the valid password';
RegExp regExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
