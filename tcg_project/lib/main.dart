import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tcg_project/view_model/dashboard_view_model.dart';
import 'view/login_page.dart';
import '../view_model/login_view_model.dart';
import 'provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tcg_project/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const TCGApp());
}

class TCGApp extends StatelessWidget {
  const TCGApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoute,
      ));
  }
}
