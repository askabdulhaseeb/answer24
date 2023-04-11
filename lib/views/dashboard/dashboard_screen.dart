import 'package:answer24/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      Text('Chat Page'),
      Text('Call'),
      Text('Camera'),
      Text('Profile'),
    ];
    return Scaffold(
      body: Consumer<AppProvider>(builder: (context, appPro, _) {
        return Center(child: _pages[appPro.currentTap]);
      }),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}
