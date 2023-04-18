import 'package:flutter/material.dart';

var kInputDecoration = InputDecoration(
hintText: "please enter password",
fillColor: Colors.green,
hintStyle: TextStyle(
fontSize: 16,
fontFamily: "Poppins",
fontWeight: FontWeight.w400,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(5),
borderSide: BorderSide(color: Colors.black, width: .5)
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(5),
borderSide: BorderSide(color: Colors.grey, width: .5)
),
);