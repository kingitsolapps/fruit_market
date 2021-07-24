// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// // class EmailSignUpModel {

// // }

//   Future<FirebaseApp>? _firebaseApp;
//   bool isLoggedIn = false;
//   String? name;

//   @override
//   void initState() {
//     super.initState();
//     _firebaseApp = Firebase.initializeApp();
//   }

//   void _signOut() async {
//     await FirebaseAuth.instance.signOut();
//     setState(() {
//       isLoggedIn = false;
//       name = null;
//     });
//   }

//   void _googleSignIn() async {
//     final googleSignIn = GoogleSignIn();
//     final signInAccount = await googleSignIn.signIn();

//     final googleAccountAuthentication = await signInAccount.authentication;

//     final credential = GoogleAuthProvider.credential(
//         accessToken: googleAccountAuthentication.accessToken,
//         idToken: googleAccountAuthentication.idToken);

//     await FirebaseAuth.instance.signInWithCredential(credential);

//     if (FirebaseAuth.instance.currentUser != null) {
//       print('Google Authentication Successful');
//       print('${FirebaseAuth.instance.currentUser.displayName} signed in.');
//       setState(() {
//         isLoggedIn = true;
//         name = FirebaseAuth.instance.currentUser.displayName;
//       });
//     } else {
//       print('Unable to sign in');
//     }
//   }
////////////////////////////////////////////////////////////

