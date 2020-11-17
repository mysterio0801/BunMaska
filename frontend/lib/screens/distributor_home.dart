import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frontend/screens/shop_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class DistributorHome extends StatefulWidget {
  @override
  _DistributorHomeState createState() => _DistributorHomeState();
}

class Distributor {
  String baseUrl = "https://chai-app.herokuapp.com/";
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future<http.Response> getDistributorInfo() async {
    String token = await storage.read(key: "token");
    var distDetails = http.get(baseUrl + "getDistributorInfo", headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    });
    print(distDetails);

    return distDetails;
  }
}

class _DistributorHomeState extends State<DistributorHome> {
  String baseUrl = "https://chai-app.herokuapp.com/";
  FlutterSecureStorage storage = FlutterSecureStorage();

  List menuItemList = [];
  List status = ['Opened', 'Closed', 'Opened', 'Opened'];

  Future<http.Response> getMenuList(String vendor_id) async {
    String token = await storage.read(key: "token");
    var distributorMenu = await http
        .get(baseUrl + "getMenuList" + "/" + vendor_id, headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    });
    print(distributorMenu);
    return distributorMenu;
  }

  Map distributorDetails;
  Map menuList;

  String _distributorId;
  String _email;
  String _shopName;
  String _ownerName;
  String _password;
  String _address;
  String _contact;

  @override
  void initState() {
    // TODO: implement initState
    Distributor().getDistributorInfo().then((value) => {
          distributorDetails = jsonDecode(value.body),
          distributorDetails = distributorDetails['distributor'],
          _distributorId = distributorDetails['_id'],
          _email = distributorDetails['email'],
          _shopName = distributorDetails['shopName'],
          _ownerName = distributorDetails['ownerName'],
          _password = distributorDetails['password'],
          _address = distributorDetails['address'],
          _contact = distributorDetails['contact'],
          getMenuList(_distributorId).then((value) => {
                menuList = jsonDecode(value.body),
                for (final item in menuList['menuList'])
                  {menuItemList.add(item), print(item['dishName'])},
                print(menuItemList)
              })
        });
    super.initState();
  }

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
                itemCount: menuItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        selectedshop = menuItemList[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShopScreen()));
                      },
                      title: Text(menuItemList[index]['dishName']),
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
