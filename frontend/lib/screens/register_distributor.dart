import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/distributor_home.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';

import 'package:frontend/screens/login_distributor.dart';

class RegisterDistributor extends StatefulWidget {
  @override
  _RegisterDistributorState createState() => _RegisterDistributorState();
}

class _RegisterDistributorState extends State<RegisterDistributor> {
  String baseUrl = "https://chai-app.herokuapp.com/";

  String _ownerName;
  String _shopName;
  String _contact;
  String _address;
  String _password;
  String _email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildOwnerName() {
    return TextFormField(
      decoration: textfieldDecor('Owner Name', Icon(Icons.person)),
      validator: (String value) {
        if (value.isEmpty) {
          return "Owner Name is required";
        }

        return null;
      },
      onSaved: (String value) {
        _ownerName = value;
      },
    );
  }

  Widget _buildShopName() {
    return TextFormField(
      decoration: textfieldDecor('Shop Name', Icon(Icons.shop)),
      validator: (String value) {
        if (value.isEmpty) {
          return "Shop Name is required";
        }

        return null;
      },
      onSaved: (String value) {
        _shopName = value;
      },
    );
  }

  Widget _buildContact() {
    return TextFormField(
      decoration: textfieldDecor('Contact No.', Icon(Icons.contact_phone)),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return "Contact No. is required";
        }

        return null;
      },
      onSaved: (String value) {
        _contact = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: textfieldDecor('Address', Icon(Icons.location_city_outlined)),
      validator: (String value) {
        if (value.isEmpty) {
          return "Address is required";
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildPassword() {
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

  Widget _buildEmail() {
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Image(
                  image: AssetImage('images/bun_maska.png'),
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: _buildOwnerName()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: _buildShopName()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: _buildEmail()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: _buildContact()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: _buildAddress()),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: _buildPassword()),
                        SizedBox(height: 35.0),
                        RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 160.0, vertical: 5.0),
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (!_formKey.currentState.validate()) {
                                return null;
                              }

                              _formKey.currentState.save();

                              Map<String, String> data = {
                                "shopName": _shopName,
                                "ownerName": _ownerName,
                                "contact": _contact,
                                "address": _address,
                                "password": _password,
                                "email": _email
                              };
                              var response = await http
                                  .post(baseUrl + "register", body: data);
                              print(response.body);
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginDistributor()));
                            }),
                      ],
                    )),
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
