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

  String baseUrl = "https://chai-app.herokuapp.com/";
  String _password;
  String _email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLoginPassword() {
    return TextFormField(
      decoration: textfieldDecor('Password', Icon(Icons.lock_outline)),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return "Password is required";
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildLoginEmail() {
    return TextFormField(
      decoration: textfieldDecor('Enter your Email', Icon(Icons.person)),
      validator: (String value) {
        if (value.isEmpty) {
          return "Email is required";
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "Please enter a valid email address";
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

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
                Form(
                    key: _formKey,
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: _buildLoginEmail()),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: _buildLoginPassword()),
                      SizedBox(height: 40.0),
                      RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 160.0, vertical: 5.0),
                          child: Text(
                            'Log In',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              return null;
                            }

                            _formKey.currentState.save();

                            Map<String, String> data = {
                              "email": _email,
                              "password": _password
                            };
                            var response =
                                await http.post(baseUrl + "login", body: data);

                            if (response.statusCode == 200 ||
                                response.statusCode == 201) {
                              Map<String, dynamic> output =
                                  json.decode(response.body);
                              await storage.write(
                                  key: "token", value: output["token"]);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DistributorHomeScreen()));
                            }
                          })
                    ])),
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
