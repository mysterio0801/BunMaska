import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/screens/shop_screen.dart';

class ConsumerHome extends StatefulWidget {
  @override
  _ConsumerHomeState createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
  List shops = ['Shop 1,Shop 2, Shop 3, Shop 4'];
  List status = ['Opened', 'Closed', 'Opened', 'Opened'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find your food destination'),
      ),
      backgroundColor: Color(0xfffcf5ee),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.0),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: shops.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        selectedshop = shops[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShopScreen()));
                      },
                      title: Text(shops[index]),
                      subtitle: Text(status[index]),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
