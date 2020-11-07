import 'package:flutter/material.dart';

class ConsumerHome extends StatefulWidget {
  @override
  _ConsumerHomeState createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
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
                SizedBox(height: 20.0),
                Text('Consumer Home'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}