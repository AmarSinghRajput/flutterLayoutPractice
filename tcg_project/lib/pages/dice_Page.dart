import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var number = 0;

  void changeNum() {
    setState(() {
      number = Random().nextInt(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                ),
              onPressed: (){
                changeNum();
                print(number);
              },
              child: Text("$number")
            ),
          ),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan)
              ),
                onPressed: (){
                  print("pressed");
                },
                child: Image.asset("assests/images/photo.jpeg")
            ),
          ),
        ],
      ),
    );
  }
}
