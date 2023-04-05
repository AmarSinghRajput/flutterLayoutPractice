import 'package:flutter/material.dart';
import 'package:tcg_project/pages/dice_Page.dart';

import 'login_page.dart';

// void main() {
//   runApp(LoginPage());
// }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Dice Game"
        ),
      ),
      body: DicePage(),
    ),
  ));
}