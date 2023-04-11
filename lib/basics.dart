import 'package:answer24/views/user_screens/edit_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'providers/app_provider.dart';
import 'views/auth/signin_screen.dart';
import 'views/dashboard/dashboard_screen.dart';

final List<SingleChildWidget> myProviders = [
  ChangeNotifierProvider.value(value: AppProvider()),
];

final Map<String, WidgetBuilder> myRoutes = <String, WidgetBuilder>{
  SignInScreen.routeName: (_) => const SignInScreen(),
  DashboardScreen.routeName: (_) => const DashboardScreen(),

  // User Screen
  EditUserScreen.routeName:(_)=>const EditUserScreen(),
};
