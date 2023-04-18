import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookServices {
  static final _auth = FacebookAuth.instance;

  static signInWithFacebook() async {
      final fbSignInResult = await _auth.login(permissions: ["public_profile"]).then((value) {
        FacebookAuth.instance.getUserData().then((userData) async {
          print(userData);
        });
      });
    }

  fbSignOut() async {
    await _auth.logOut();
  }
}