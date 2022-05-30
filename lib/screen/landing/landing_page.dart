import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/screen/landing/home_main.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:eyepax_assignment/screen/landing/widget/profile_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  List<Widget> body = [
    HomeMain(),
    HomeMain(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(child: body[_selectedIndex]),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          backgroundColor: Colors.white,
          margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _selectedIndex,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          // enableFloatingNavBar: false,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: AppColors.primaryColor,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: AppColors.primaryColor,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
