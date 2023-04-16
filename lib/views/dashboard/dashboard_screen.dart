import 'package:answer24/providers/app_provider.dart';
import 'package:answer24/views/dashboard_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard_pages/chat_dashboard_page.dart';
import 'main_bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      ChatDashboardPage(),
      Text('Calls'),
      Text('Camera'),
      ProfilePage(),
    ];
    return Scaffold(
      body: Consumer<AppProvider>(builder: (context, appPro, _) {
        return Center(child: pages[appPro.currentTap]);
      }),
      bottomNavigationBar: const MainBottomNavBar(),
    );
  }
}
