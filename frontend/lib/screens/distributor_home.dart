import 'package:flutter/material.dart';

class DistributorHomeScreen extends StatefulWidget {
  @override
  _DistributorHomeScreenState createState() => _DistributorHomeScreenState();
}

class _DistributorHomeScreenState extends State<DistributorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf5ee),
      appBar: AppBar(
        title: Text('BunMaska'),
      ),
    );
  }
}