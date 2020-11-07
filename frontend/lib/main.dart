import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'BunMaska',
	theme: OurTheme().buildTheme(),
  home: WelcomeScreen(),
  // initialRoute: WelcomeScreen.id,
  // routes: {
  //   WelcomeScreen.id: (context) => WelcomeScreen()
  // },
	debugShowCheckedModeBanner: false,
	);
}
}
