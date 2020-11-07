import 'package:flutter/material.dart';

class LoginDistributor extends StatefulWidget {
  @override
  _LoginDistributorState createState() => _LoginDistributorState();
}

class _LoginDistributorState extends State<LoginDistributor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BunMaska'),),
      backgroundColor: Color(0xfffcf5ee),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image(image: AssetImage('images/bun_maska.png'),),
                SizedBox(height: 20.0),
                Text('Login'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}