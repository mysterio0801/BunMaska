import 'package:flutter/material.dart';
import 'package:frontend/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BunMaska',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomeScreen(),
      // initialRoute: WelcomeScreen.id,
      // routes: {
      //   WelcomeScreen.id: (context) => WelcomeScreen()
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
