import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inside/Constants/Constants.dart';
import 'package:inside/Constants/Helpers.dart';
import 'package:inside/Settings/SettingsModel.dart';
import 'package:inside/User/login.dart';
import 'package:inside/User/profile_view.dart';
import 'package:inside/User/reset_password_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<SettingsModel> itemData = <SettingsModel>[
    SettingsModel(data: [Data(menuId: '0', menuName: 'Profile')]),
    SettingsModel(data: [Data(menuId: '1', menuName: 'Theme')]),
    SettingsModel(data: [Data(menuId: '2', menuName: 'Reset Password')]),
    SettingsModel(data: [Data(menuId: '3', menuName: 'Logout')])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: row(itemData[index].data!.first.menuName!),
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileView()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileView()),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordView()),
                      );
                      break;
                    case 3:
                      _dialogBuilder(context);
                      break;
                  }

            });
          }),
    );
  }
}

Widget row(String mainTitle) {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              mainTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
          ],
        )
      ]),
    ),
  );
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(txtLogoutForApplication),
        content: const Text(
          txtLogoutDescription,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(txtNo),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(txtYes),
            onPressed: () async {

              Helpers.removeDataFromSharedPrefference();
              Navigator.of(context).pushAndRemoveUntil(
                // the new route
                MaterialPageRoute(
                  builder: (BuildContext context) => Login(),
                ),

                // this function should return true when we're done removing routes
                // but because we want to remove all other screens, we make it
                // always return false
                    (Route route) => false,
              );
            },
          ),
        ],
      );
    },
  );
}

