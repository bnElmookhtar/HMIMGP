import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/best_projects/best_projects.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/home/home.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/ideas/ideas.dart';
import 'package:hmimgp/src/featcheres/home_layout/screens/settings/screens/profile.dart';

import '../../constants/strings/app_strings/home_layout.dart';
class HomeLayout extends StatefulWidget {
  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens =const [
    Home(),
    BestProjects(),
    Ideas(),
    UserProfile(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: deepBlue,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          size: large,
        ),
        selectedFontSize: small_2,
        unselectedItemColor: offBlue,
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: offOrange,
            label: home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gpp_good_rounded),
            backgroundColor: offOrange,
            label: bestProjects,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.light_mode),
            backgroundColor:offOrange,
            label: ideas,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            backgroundColor: offOrange,
            label: settings,
          ),
        ],
        type: BottomNavigationBarType.shifting,
      ),
      body: screens[currentIndex],
    );
  }
}
