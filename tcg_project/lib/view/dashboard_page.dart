import 'package:flutter/material.dart';

import '../utilities/shared_preferance.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // set to false to remove back button
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Dashboard!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String? myValue = await SharedPrefHelper.getData("token");
                print(myValue);
              },
              child: Text('View Profile'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print("call refresh token");
              },
              child: Text('refresh token'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await SharedPrefHelper.setString("token", "value");
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
