import 'dart:ui';

import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

String selectedshop;

class _ShopScreenState extends State<ShopScreen> {

  List items = ['Bun Makkhan', 'Kulhad Chai', 'Bina kulhad wali Chai', 'Masala Maggi', 'Pav Bhaji', 'Chowmein', 'Chicken Chowmien', 'Paneer Maggi'];
  List availability = ['Available','Not Available','Available','Not Available','Available','Not Available','Available','Not Available',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf5ee),
      appBar: AppBar(
        title: Text('Find your meal'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Text(selectedshop, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0),
            Expanded(
                child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(items[index]),
                      subtitle: Text('Status: ' + availability[index]),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}