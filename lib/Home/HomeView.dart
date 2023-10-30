import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inside/Home/Dashboard.dart';
import 'package:inside/Leaves/LeaveForm/ApplyLeaveView.dart';
import 'package:inside/Leaves/leave_list_view.dart';
import 'package:inside/Settings/SettingsView.dart';
import 'package:inside/User/profile_view.dart';

import '../Constants/Constants.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  final String title = 'Inside';

  @override
  State<HomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<HomeView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: kPrimaryColors,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.home, color: Colors.white),
              icon: Icon(CupertinoIcons.home),
              label: 'Dashboard',
            ),
            NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.arrow_2_circlepath_circle_fill, color: Colors.white),
              icon: Icon(CupertinoIcons.arrow_2_circlepath_circle_fill),
              label: 'Leaves',
            ),
            NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.settings, color: Colors.white),
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        body: <Widget>[
          DashbarodView(),
          LeaveListView(),
          SettingsView(),
        ][currentPageIndex]);
  }
}
