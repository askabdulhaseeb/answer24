import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppProvider navBar = Provider.of<AppProvider>(context);
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
      selectedItemColor: Theme.of(context).primaryColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Colors.grey,
      currentIndex: navBar.currentTap,
      onTap: (int index) => navBar.onTabTapped(index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble),
          activeIcon: Icon(CupertinoIcons.chat_bubble_fill),
          label: 'chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.phone),
          activeIcon: Icon(CupertinoIcons.phone_fill),
          label: 'Call',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.camera),
          activeIcon: Icon(CupertinoIcons.camera_fill),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          activeIcon: Icon(CupertinoIcons.person_fill),
          label: 'Live',
        ),
      ],
    );
  }
}
