import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../components/socal_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'sign_up_form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<FirebaseApp>? _firebaseApp;
  bool isLoggedIn = false;
  String? name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04), // 4%
                Text("Register Account", style: headingStyle),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final googleSignIn = GoogleSignIn();
                        final signInAccount = await googleSignIn.signIn();

                        final googleAccountAuthentication =
                            await signInAccount.authentication;

                        final credential = GoogleAuthProvider.credential(
                            accessToken:
                                googleAccountAuthentication.accessToken,
                            idToken: googleAccountAuthentication.idToken);

                        await FirebaseAuth.instance
                            .signInWithCredential(credential);

                        if (FirebaseAuth.instance.currentUser != null) {
                          print('Google Authentication Successful');
                          print(
                              '${FirebaseAuth.instance.currentUser!.displayName} signed in.');
                          setState(() {
                            isLoggedIn = true;
                            name =
                                FirebaseAuth.instance.currentUser!.displayName;
                          });
                        } else {
                          print('Unable to sign in');
                        }
                      },
                      child: SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        // press: () {},
                      ),
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      // press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      // press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
