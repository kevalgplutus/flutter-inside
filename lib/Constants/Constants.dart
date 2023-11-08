import 'package:flutter/material.dart';

/*
Constant File to get the things easily changed throughout the app
 */


const kPrimaryColors = Colors.indigoAccent;
const kPrimaryColorsAccent = Colors.indigoAccent;
const kCopyRight = "© 2023 Plutus Technologies Pvt.Ltd.";


// API Url's
const kBaseURL = "https://inside2.plutustec.com";
const kAPIPath = "/api/v1/emp";
const kURILogin = "/login";

// Toast messages
const txtOTPSent = "OTP sent successfully to your registered mobile number!";


// Login Validation messages
const errEmptyEmail = 'Please enter the email';
const errInvalidEmail = 'Please enter the valid email';
const errEmptyPassword = 'Please enter the password';
const errInvalidPassword = 'Please enter the valid password';
RegExp regExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');


// Placeholders
const pHEmail = 'Enter the email';
const phPassword = 'Enter the password';


// Texts
const txtForgotPassword = 'Forgot Password?';
const txtSignIn = 'Sign In';
const txtOR = 'OR';
const txtLogoutForApplication = 'Logout from the application?';
const txtLogoutDescription = 'Are you sure, you want to logout from the application?';
const txtYes = 'Yes';
const txtNo = 'No';


// Assets Image Paths
const imgPathLogo = 'assets/images/logoonly.svg';