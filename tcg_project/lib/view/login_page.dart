import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcg_project/service/services/facebook_service.dart';
import 'package:tcg_project/resources/constants.dart';
import 'package:tcg_project/resources/styles.dart';
import 'package:tcg_project/utilities/helper.dart';
import 'package:tcg_project/service/services/firebase_services.dart';
import 'package:tcg_project/utilities/shared_preferance.dart';
import 'package:tcg_project/utilities/validations.dart';
import 'package:provider/provider.dart';
import '../view_model/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children:[
                SizedBox(
                  width: _size.width,
                  height: _size.height * 0.275,
                ),
                // email TF
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _emailController,
                    validator: validateTextField,
                    keyboardType: TextInputType.emailAddress,
                    decoration: kInputDecoration.copyWith(
                      hintText: "please enter email id",
                      prefixIcon: Icon(Icons.email)
                    ),
                    onChanged: (value){
                      print(_emailController.text);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // password TF
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      controller: _passwordController,
                     obscureText: _hidePassword,
                    decoration: kInputDecoration.copyWith(
                        prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: _hidePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                      ),
                    )
                  ),
                ),
                // forgot password button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){
                            print("forgot password pressed");
                          }, child: Text("Forgot password?",
                          style: TextStyle(
                            fontSize: 16,
                          )
                      )
                      ),
                    ],
                  ),
                ),
                // login button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: _loginViewModel.loading ? CircularProgressIndicator(
                    color: Colors.red,
                  ) : Container(
                    width: 160,
                    height: 40,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.green
                        ),
                        onPressed: () {
                          if (!Validations.isValidUsername(_emailController.value.text)) {
                            Helper.showAlert(context, Constants.emailValidationTitle,
                                Constants.emailValidationMsg);
                          } else if (!Validations.isValidPassword(_passwordController.value.text)) {
                            Helper.showAlert(
                                context, Constants.passValidationTitle, Constants.passValidationMsg);
                          } else {
                            Map data = {
                              'username' : _emailController.text.toString(),
                              'password' : _passwordController.text.toString(),
                            };
                            _loginViewModel.loginApi(data , context);
                          }
                          },
                        child: Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        )
                    )
                    ),
                  ),
                ),
                //or continue with
                Container(
                  width: _size.width,
                  margin: EdgeInsets.fromLTRB(20, 20,40,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 1,
                            width: 80,
                            child: Divider(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("or continue with")
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 1,
                            width: 80,
                            child: Divider(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // social media logins
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                            onPressed: () async {
                              await FirebaseServices().signInWithGoogle();
                              Helper.showAlert(context, "google loggedin User's email", "${FirebaseAuth.instance.currentUser!.email}");
                            }, child: Image.asset("assets/images/googleLogo.png", height: 50, width: 50)
                        ),
                        OutlinedButton(
                            onPressed: (){
                              print("fb login");
                              FacebookServices.signInWithFacebook();
                            }, child: Image.asset("assets/images/fbLogo.png", height: 50, width: 50)
                        ),
                        OutlinedButton(
                            onPressed: () async {
                              print("apple login");
                            }, child: Image.asset("assets/images/appleLogo.png", height: 50, width: 50)
                        ),
                      ],
                    )
                ),
              ]
          ),
        ),
      ),
    );
  }
}


String? validateTextField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}