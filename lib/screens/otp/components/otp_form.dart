import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/default_button.dart';
import '../../../size_config.dart';

import '../../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpForm extends StatefulWidget {
  OtpForm({
    Key? key,
    this.phone,
  }) : super(key: key);
  final String? phone;
  // final String number = phone;
  @override
  _OtpFormState createState() => _OtpFormState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    final phoneNumber = '+92${widget.phone}';
    print(phoneNumber);
    final user = _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber.toString(),
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
        ),
        pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
      print(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode!);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.15),
          // DefaultButton(
          //   text: "Continue",
          //   press: () {},
          // )
          MaterialButton(
            onPressed: () {
              Get.snackbar('Wait', 'Working on it');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: kPrimaryColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              child: Text(
                'Sign in ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
