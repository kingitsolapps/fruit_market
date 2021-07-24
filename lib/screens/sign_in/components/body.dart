import 'package:flutter/material.dart';
import 'package:fruit_market/constants.dart';
import 'package:fruit_market/providers/userLoginProvider.dart';
import 'package:fruit_market/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../../../components/no_account_text.dart';
import '../../../components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatefulWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Future<FirebaseApp>? _firebaseApp;
  // bool isLoggedIn = false;
  // String? name;

  // bool _isLoggedIn = false;
  // GoogleSignInAccount? _userObj;
  // GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<void> _handleSignIn() async {
  //   try {
  //     print('Start try portion');
  //     await _googleSignIn.signIn();
  //     print('end try portion');
  //   } catch (error) {
  //     print('start error');
  //     print(error);
  //     print('end error');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _firebaseApp = Firebase.initializeApp();
  // }

  // void _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   setState(() {
  //     isLoggedIn = false;
  //     name = null;
  //   });
  // }

  // void _googleSignIn() async {
  //   final googleSignIn = GoogleSignIn();
  //   final signInAccount = await googleSignIn.signIn();

  //   final googleAccountAuthentication = await signInAccount!.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAccountAuthentication.accessToken,
  //       idToken: googleAccountAuthentication.idToken);

  //   await FirebaseAuth.instance.signInWithCredential(credential);

  //   if (FirebaseAuth.instance.currentUser != null) {
  //     print('Google Authentication Successful');
  //     print('${FirebaseAuth.instance.currentUser!.displayName} signed in.');
  //     setState(() {
  //       isLoggedIn = true;
  //       name = FirebaseAuth.instance.currentUser!.displayName;
  //     });
  //   } else {
  //     print('Unable to sign in');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: _firebaseApp,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting)
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    return Consumer<UserSignInProvider>(
      builder: (context, signInModal, _) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.04),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password  \nor continue with social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.08),
                    SignForm(),
                    SizedBox(height: SizeConfig.screenHeight! * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print('starting');
                            signInModal.registerWithGoogle();
                            // _googleSignIn.signIn().then((userData) {
                            //   setState(() {
                            //     _isLoggedIn = true;
                            //     _userObj = userData!;
                            //   });
                            // }).catchError((e) {
                            //   print(e);
                            // });
                            // _handleSignIn();
                            // _googleSignIn();
                            // final googleSignIn = GoogleSignIn();
                            // final signInAccount = await googleSignIn.signIn();

                            // final googleAccountAuthentication =
                            //     await signInAccount!.authentication;

                            // final credential = GoogleAuthProvider.credential(
                            //     accessToken:
                            //         googleAccountAuthentication.accessToken,
                            //     idToken: googleAccountAuthentication.idToken);
                            // print('id token');

                            // await FirebaseAuth.instance
                            //     .signInWithCredential(credential);

                            // if (FirebaseAuth.instance.currentUser != null) {
                            //   print('Google Authentication Successful');
                            //   print(
                            //       '${FirebaseAuth.instance.currentUser!.displayName} signed in.');
                            //   setState(() {
                            //     isLoggedIn = true;
                            //     name = FirebaseAuth
                            //         .instance.currentUser!.displayName;
                            //   });
                            //   Get.to(
                            //     HomeScreen(),
                            //   );
                            // } else {
                            //   print('Unable to sign in');
                            //   Get.defaultDialog(
                            //     title: 'Erroe',
                            //     middleText: 'Unable to sign in',
                            //   );
                            // }
                          },
                          child: SocalCard(
                            icon: "assets/icons/google-icon.svg",
                            // press: () async {

                            // },
                          ),
                        ),
                        SocalCard(
                          icon: "assets/icons/facebook-2.svg",
                          // press: () {
                          //   // Get.snackbar('Error', 'Not availale now');
                          // },
                        ),
                        SocalCard(
                          icon: "assets/icons/twitter.svg",
                          // press: () {
                          //   // Get.snackbar('Error', 'Not available now');
                          //   // Get.defaultDialog(title: "Working on it");
                          // },
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    NoAccountText(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
