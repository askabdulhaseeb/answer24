import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/auth/signin_screen.dart';
import 'basics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: myProviders,
      child: MaterialApp(
        title: 'Answer24',
        theme: ThemeData(
          primaryColor: const Color(0xFF007FC6),
        ),
        home: const SignInScreen(),
        routes: myRoutes,
      ),
    );
  }
}
