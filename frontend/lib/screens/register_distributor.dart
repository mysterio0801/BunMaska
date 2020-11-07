import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/distributor_home.dart';

class RegisterDistributor extends StatefulWidget {
  @override
  _RegisterDistributorState createState() => _RegisterDistributorState();
}

class _RegisterDistributorState extends State<RegisterDistributor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BunMaska'),
      ),
      backgroundColor: Color(0xfffcf5ee),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Image(image: AssetImage('images/bun_maska.png'),
                  height: 170.0,
                  width: 170.0,
                ),
                Center(
                  child: TyperAnimatedTextKit(
                    text: ['Be a part of the BunMaska Community..!!'],
                    textStyle: TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 45.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    decoration: textfieldDecor('Name', Icon(Icons.person)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    decoration: textfieldDecor('Shop Name', Icon(Icons.shop)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    decoration: textfieldDecor('Contact Number', Icon(Icons.contact_phone)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    decoration: textfieldDecor('Address', Icon(Icons.location_city_outlined)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    decoration: textfieldDecor('Email', Icon(Icons.email_outlined)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: textfieldDecor('Password', Icon(Icons.lock_outline)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DistributorHomeScreen()));
                    },
                    child: Text('Register',
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

  //TextField Decoration
  InputDecoration textfieldDecor(String hint, Widget iconname) {
    return InputDecoration(
      prefixIcon: iconname,
      hintText: hint,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ), 
    );
  }
}