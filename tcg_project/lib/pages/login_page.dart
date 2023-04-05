import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        home: Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
              radius: 50,
              foregroundImage: AssetImage("assests/images/photo.jpeg"),
            ),
              Text(
                  "Amar Singh",
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                color: Colors.cyan,
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        Icon(Icons.email),
                        Text("singh.amarpune@gmail.com")
                  ],
                ),
              ),
              Container(
                color: Colors.cyan,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pin_drop_rounded),
                    Text("Mumbai, Maharashtra, India")
                  ],
                ),
              ),
            ]),

      ),
    ));
  }
}
