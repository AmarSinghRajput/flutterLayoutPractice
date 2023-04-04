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
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text("Hello"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    // margin: EdgeInsets.symmetric(vertical: 20),
                    color: Colors.yellow,
                    child: Text("Hello"),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    // margin: EdgeInsets.symmetric(vertical: 20),
                    color: Colors.greenAccent,
                    child: Text("Hello"),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 100,
                // margin: EdgeInsets.symmetric(vertical: 20),
                color: Colors.blue,
                child: Text("Hello"),
              )
            ]),
      ),
    ));
  }
}
