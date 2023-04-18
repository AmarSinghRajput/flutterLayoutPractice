import 'package:flutter/material.dart';
import '../utilities/shared_preferance.dart';
import 'package:tcg_project/view_model/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _dashboardViewModel = Provider.of<DashboardViewModel>(context);

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
                _dashboardViewModel.refreshTokenApi(context);
              },
              child: _dashboardViewModel.loading ? CircularProgressIndicator(
                color: Colors.red,
              ) : Text('refresh token'),
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
