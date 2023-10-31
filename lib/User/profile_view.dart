
import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inside/Constants/Constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            profilePicture(),
            profileRow("Personal"),
            profileRow("Contact"),
            profileRow("Employement"),
            profileRow("Financial"),
            profileRow("Skill")
          ],
        ));
  }
}

Widget profilePicture() {
  return Container(
    child: SvgPicture.asset('assets/images/logoonly.svg',
        height: 200, width: 200, color: kPrimaryColors)
  );
}

Widget profileRow(String mainTitle) {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(mainTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColors,
                    ),
                  ),
                  Icon(CupertinoIcons.square_pencil,
                    color: kPrimaryColors,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name"),
                  Text("Keval Gajjar"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gender"),
                  Text("Male"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Birth Date"),
                  Text("06-05-1992"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Blood Group"),
                  Text("B+ve"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Merital Status"),
                  Text("Married"),
                ],
              )
            ],
          ),

        )
      ],
    ),
  );
}
