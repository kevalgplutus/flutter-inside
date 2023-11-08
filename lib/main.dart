import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inside/Constants/Helpers.dart';
import 'package:inside/Home/HomeView.dart';
import 'package:inside/User/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool userIsLoggedIn;

  getLoggedInState() async {
    await Helpers.getFullUserData().then((value) {
      setState(() {
        userIsLoggedIn = (value.data!.id!.isEmpty) ? false : true ;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => userIsLoggedIn != null && userIsLoggedIn
                  ? HomeView()
                  : Login(),
            ));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: const Center(child: Login()));
  }
}
