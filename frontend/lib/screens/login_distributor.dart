import 'package:flutter/material.dart';
import 'package:frontend/screens/distributor_home.dart';
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: TextFormField(
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
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DistributorHomeScreen()));
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterDistributor(),),
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
