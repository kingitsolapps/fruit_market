import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_market/constants.dart';
import 'package:get/get.dart';

import '../size_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SocalCard extends StatefulWidget {
  const SocalCard({
    Key? key,
    this.icon,
    // this.press,
  }) : super(key: key);

  final String? icon;
  // final Function? press;

  @override
  _SocalCardState createState() => _SocalCardState();
}

// final String? title;
class _SocalCardState extends State<SocalCard> {
  Future<FirebaseApp>? _firebaseApp;
  bool isLoggedIn = false;
  String? name;

  @override
  void initState() {
    super.initState();
    _firebaseApp = Firebase.initializeApp();
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      isLoggedIn = false;
      name = null;
    });
  }

  void _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final signInAccount = await googleSignIn.signIn();

    final googleAccountAuthentication = await signInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAccountAuthentication.accessToken,
        idToken: googleAccountAuthentication.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    if (FirebaseAuth.instance.currentUser != null) {
      print('Google Authentication Successful');
      print('${FirebaseAuth.instance.currentUser!.displayName} signed in.');
      setState(() {
        isLoggedIn = true;
        name = FirebaseAuth.instance.currentUser!.displayName;
      });
    } else {
      print('Unable to sign in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(widget.icon!),
    );
  }
}
