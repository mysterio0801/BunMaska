import 'package:flutter/material.dart';
import 'package:frontend/screens/register_distributor.dart';

class LoginDistributor extends StatefulWidget {
  @override
  _LoginDistributorState createState() => _LoginDistributorState();
}

class _LoginDistributorState extends State<LoginDistributor> {
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
                Image(
                  image: AssetImage('images/bun_maska.png'),
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Welcome Back...',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterDistributor()),);
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
