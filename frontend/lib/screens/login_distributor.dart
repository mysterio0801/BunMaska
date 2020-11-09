import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/distributor_home.dart';
import 'package:frontend/screens/register_distributor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'consumer_home.dart';

class LoginDistributor extends StatefulWidget {
  @override
  _LoginDistributorState createState() => _LoginDistributorState();
}

class _LoginDistributorState extends State<LoginDistributor> {
  FlutterSecureStorage storage = FlutterSecureStorage();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BunMaska'),
      ),
      backgroundColor: Color(0xfffcf5ee),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 60.0),
                Image(
                  image: AssetImage('images/bun_maska.png'),
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    controller: _password,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: RaisedButton(
                    onPressed: () async {
                      Map<String, String> data = {
                        "email": _email.text,
                        "password": _password.text
                      };
                      var response = await http.post(
                          "https://chai-app.herokuapp.com/login",
                          body: data);

                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        Map<String, dynamic> output =
                            json.decode(response.body);
                        await storage.write(
                            key: "token", value: output["token"]);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DistributorHomeScreen()));
                      }
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterDistributor(),
                      ),
                    );
                  },
                  child: Text('New User? Register Here'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
