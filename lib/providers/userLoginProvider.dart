import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:http/http.dart';
// import 'package:mobi_movers/apis.dart';
// import 'package:mobi_movers/models/userLoginModel.dart';
// import 'package:progress_dialog/progress_dialog.dart';

class UserSignInProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordSecure = false;
  passHideShow() {
    passwordSecure ? passwordSecure = false : passwordSecure = true;
    notifyListeners();
  }

  //GOOGLE SIGN IN

  bool isGoogleLoggedIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<User?> registerWithGoogle() async {
    final GoogleSignInAccount _signInAccount = (await _googleSignIn.signIn())!;
    final GoogleSignInAuthentication _googleAuth =
        await _signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken, idToken: _googleAuth.idToken);

    final User user =
        await _auth.signInWithCredential(credential).then((value) {
      // ignore: unnecessary_null_comparison
      if (isGoogleLoggedIn) {
        Get.snackbar("Logged Out", "${value.user!.displayName}");
        _googleSignIn.signOut().then((value) {
          isGoogleLoggedIn = false;
          notifyListeners();
        }).catchError((e) {});
      } else {
        Get.snackbar("Logged In", "${value.user!.displayName}");
        //print(value.user!.displayName);
        isGoogleLoggedIn = true;
        notifyListeners();
      }
      return value.user!;
    });

    //   // await FirebaseFirestore.instance
    //   //     .collection('UserData')
    //   //     .doc(user.uid)
    //   //     .get()
    //   //     .then((value) {
    //   //   if (value.exists) {
    //   //    print("exist exist exist exist exist exist ");
    //   //   } else {
    //   //     FirebaseFirestore.instance.collection("UserData").doc(user.uid).set({
    //   //       "data":user.email
    //   //     });
    //   //     print(user.displayName);
    //   //     print(user.email);
    //   //   }
    //   // });
    // }

    //GOOGLE SIGN OUT
    // Future<bool?> googleSignOut() async {
    //   Get.snackbar("Logged Out", "See you again");
    //   await _googleSignIn.signOut().then((value) {
    //     isGoogleLoggedIn = false;
    //     notifyListeners();
    //     return true;
    //   }).catchError((e) {});
    //   return false;
    // }

    // FB SIGN UP
    // bool isFBLoggedIn = false;
    // Map? _fbUserObj;
    // Future<User?> registerWithFB() async {
    //   final LoginResult result = await FacebookAuth.instance.login(
    //     permissions: [
    //       'public_profile',
    //       'email',
    //       'pages_show_list',
    //       'pages_messaging',
    //       'pages_manage_metadata'
    //     ],
    //   );

//     final Ac

// ---------end------------
    // FacebookAuth.instance
    //     .login(permissions: ['public_profile', 'email', 'pages_show_list', 'pages_messaging', 'pages_manage_metadata'],).then((value) {
    //   FacebookAuth.instance.getUserData().then((userData) {
    //     isFBLoggedIn = true;
    //     _fbUserObj = userData;
    //     notifyListeners();
    //     Get.snackbar("Logged In", "${_fbUserObj!["name"]}");
    //   });
    // if (isFBLoggedIn) {
    //   FacebookAuth.instance.logOut().then((value) {
    //     isFBLoggedIn = false;
    //     notifyListeners();
    //     _fbUserObj = {};
    //   });
    // }
    // else {
    //   FacebookAuth.instance.getUserData().then((userData) {
    //     isFBLoggedIn = true;
    //     _fbUserObj = userData;
    //     notifyListeners();
    //     Get.snackbar("Logged In", "${_fbUserObj!["name"]}");
    //     return _fbUserObj;
    //   });
    // }
    // });
    // return null;

    // userLogin(BuildContext context) async {
    //   // print("==============================");
    //   // print(emailController.text);
    //   // print(passwordController.text);
    //   // print("==============================");
    //   ProgressDialog pd = ProgressDialog(context);
    //   pd.style(
    //       message: 'Processing...',
    //       borderRadius: 10.0,
    //       backgroundColor: Colors.white,
    //       progressWidget: CircularProgressIndicator(),
    //       elevation: 10.0,
    //       insetAnimCurve: Curves.easeInOut,
    //       progress: 0.0,
    //       maxProgress: 100.0,
    //       progressTextStyle: TextStyle(
    //           color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    //       messageTextStyle: TextStyle(
    //           color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
    //   await pd.show();
    //
    //   var url = Uri.parse(APIs().driverLoginApi);
    //
    //   final response = await post(url, headers: {
    //     APIs().apiKey: APIs().apiKeyValue
    //   }, body: {
    //     "username": emailController.text,
    //     "password": passwordController.text
    //   });
    //   print("call");
    //   if (response.statusCode == 200) {
    //     debugPrint("==============================");
    //     debugPrint(response.body);
    //     debugPrint("==============================");
    //
    //
    //       var data = UserLoginModel.fromJson(jsonDecode(response.body));
    //       var newdata = Provider.of<UserProvider>(context, listen: false);
    //
    //       newdata.addlogindata(data);
    //       print(data.token);
    //       await pd.hide();
    //
    //       // showDialog(
    //       //     context: context,
    //       //     builder: (_) => LogoutOverlay(
    //       //           message: "Login Successfull",
    //       //         ));
    //       // sharedPreferences.setString("token", data.token);
    //
    //       Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => AppHomePage()),
    //             (Route<dynamic> route) => false,
    //       );
    //     } else if (response.statusCode == 403) {
    //       var data = UserLoginModel.fromJson(jsonDecode(response.body));
    //       var newdata = Provider.of<UserProvider>(context, listen: false);
    //
    //       newdata.addlogindata(data);
    //       print(data.token);
    //
    //       // showDialog(
    //       //     context: context,
    //       //     builder: (_) => LogoutOverlay(
    //       //           message: "Login Successfull",
    //       //         ));
    //       // sharedPreferences.setString("token", data.token);
    //
    //       Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => AppHomePage()),
    //             (Route<dynamic> route) => false,
    //       );
    //
    //       // String rest = data["message"];
    //       // // var list = rest["message"];
    //       // print(response.body);
    //       // showDialog(
    //       //     context: context,
    //       //     builder: (_) => LogoutOverlay(
    //       //           message: "${rest}",
    //       //         ));
    //     } else {
    //       await pd.hide();
    //       var data = jsonDecode(response.body);
    //       var rest = data["info"];
    //       var list = rest["message"];
    //       print(response.body);
    //       showDialog(
    //           context: context,
    //           builder: (_) => LogoutOverlay(
    //             message: "${list}",
    //           ));
    //   }
  }
}
