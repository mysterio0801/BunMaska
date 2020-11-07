import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf5ee),
      appBar: AppBar(
        title: Text('BunMaska'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image(
                  image: AssetImage('images/bun_maska.png'),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: RaisedButton(
                    onPressed: null,
                    child: Text(
                      'Distributor',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RaisedButton(
                    onPressed: null,
                    child: Text(
                      'Consumer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
