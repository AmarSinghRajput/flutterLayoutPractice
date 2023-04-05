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
              Card(
                color: Colors.cyan,
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text("singh.amarpune@gmail.com")
                ),
              ),
              Card(
                color: Colors.cyan,
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text("singh.amarpune@gmail.com")
                ),
              ),
            ]),
      ),
    ));
  }
}
