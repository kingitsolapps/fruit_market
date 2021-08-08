import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import '../otp_form.dart';

class Body extends StatefulWidget {
  final String? phone;
  Body(this.phone);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? outputcode;
  String? phoneNumber;
  @override
  void initState() {
    super.initState();
    phoneNumber = '+92${widget.phone}';
    print(phoneNumber);
    final user = _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = '';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  firebaseCall() {
    final user = _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = '';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to +92 ${widget.phone}"),
              buildTimer(),
              SizedBox(
                height: 50,
              ),
              PinCodeFields(
                length: 6,
                fieldBorderStyle: FieldBorderStyle.Square,
                responsive: true,
                // fieldHeight: 40.0,
                // fieldWidth: 40.0,
                borderWidth: 1.0,
                // activeBorderColor: Colors.teal,
                // activeBackgroundColor: Colors.tealAccent,
                borderRadius: BorderRadius.circular(20.0),
                keyboardType: TextInputType.number,
                autoHideKeyboard: false,
                // fieldBackgroundColor: Colors.lightGreenAccent,
                // borderColor: Colors.lightGreen,
                textStyle: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
                onComplete: (output) {
                  // Your logic with pin code
                  print(output);
                  outputcode = output;
                },
              ),
              // OtpForm(phone: phone),
              // SizedBox(
              //   height: 51,
              // ),

              //
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
              GestureDetector(
                onTap: () {
                  firebaseCall();
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, double? value, child) => Text(
            "00:${value!.toStringAsFixed(0)}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
