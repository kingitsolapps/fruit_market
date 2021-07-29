import 'package:flutter/material.dart';
import 'package:fruit_market/providers/userLoginProvider.dart';
import 'package:fruit_market/screens/home/home_screen.dart';
import 'package:fruit_market/screens/otp/otp_screen.dart';
import 'package:fruit_market/screens/sign_in/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  String? phone;
  String? firstName;
  String? lastName;
  bool remember = false;
  String? verificationIdFromGoogle;
  int _state = 0;
  bool state = false;

  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error!))
      setState(() {
        errors.remove(error);
      });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSignInProvider>(
      builder: (context, signInModal, _) => Form(
        key: _formKey,
        child: Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPhoneFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // buildPasswordFormField(),
            TextFormField(
              obscureText: signInModal.passwordSecure ? false : true,
              onSaved: (newValue) => password = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.length >= 8) {
                  removeError(error: kShortPassError);
                }
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPassNullError);
                  return "";
                } else if (value.length < 8) {
                  addError(error: kShortPassError);
                  return "";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                suffixIcon: IconButton(
                  onPressed: () {
                    signInModal.passHideShow();
                  },
                  icon: Icon(
                    signInModal.passwordSecure
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            // buildConformPassFormField(),
            TextFormField(
              obscureText: signInModal.confPasswordSecure ? false : true,
              onSaved: (newValue) => conform_password = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.isNotEmpty && password == conform_password) {
                  removeError(error: kMatchPassError);
                }
                conform_password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPassNullError);
                  return "";
                } else if ((password != value)) {
                  addError(error: kMatchPassError);
                  return "";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Re-enter your password",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                suffixIcon: IconButton(
                  onPressed: () {
                    signInModal.confPassHideShow();
                  },
                  icon: Icon(
                    signInModal.confPasswordSecure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    // size: 20,
                  ),
                ),
              ),
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            // DefaultButton(
            //   text: "Continue",
            //   press: () {
            //     if (_formKey.currentState!.validate()) {
            //       _formKey.currentState!.save();
            //       // if all are valid then go to success screen
            //       Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            //     }
            //   },
            // ),
            MaterialButton(
              onPressed: () {
                // if (phone == "03027750114") {
                //   Get.to(
                //     HomeScreen(),
                //   );
                // } else {
                //   Get.snackbar('Error', 'Please Check the phone number');
                // }
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                // Get.offAll(
                //   HomeScreen(),
                // );
                // SignUpWithEmailPassword();
                Get.to(OtpScreen(this.phone));
                // SignUpMe();
                // }
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
                  'Register Account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TextFormField buildConformPassFormField() {
  //   return ;
  // }

  // TextFormField buildPasswordFormField() {
  //   // return;
  // }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
        }
        phone = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "3001234567",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
        prefix: Text('+92',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kFirstNamelNullError);
        }
        firstName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kFirstNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your First Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNamelNullError);
        }
        lastName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLastNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  SignUpWithEmailPassword() async {
    print(email);
    print(password);
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      if (user != null) {
        Get.snackbar('Success', 'Your account created successfully');

        Get.offAll(
          SignInScreen(),
        );
      } else {
        Get.defaultDialog(title: 'Error', middleText: 'Try Agiain');
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
  }
  // Future<void> verifyPhoneNo() async {
  //   // await Firebase.initializeApp();
  //   final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
  //     this.verificationIdFromGoogle = verId;
  //   };

  //   final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
  //     this.verificationIdFromGoogle = verId;
  //     print(verId);
  //     setState(() {
  //       state = false;
  //     });

  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => OneTimePassword()));

  //     // Navigator.push(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //         builder: (context) =>
  //     //             OtpScreen(data: data, id: this.verificationIdFromGoogle)));

  //     // Navigator.pushReplacement(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //         builder: (context) => OTPPage(
  //     //           phoneNumber: userPhoneNo,
  //     //           googleVerificationCode: this.verificationIdFromGoogle,
  //     //           password: _password,
  //     //           profile: _profile??" ",
  //     //           userEmail: _userEmail,
  //     //           userfirstname: _userfirstname,
  //     //           userlastname: _userlastname,
  //     //         )));
  //   };

  //   final PhoneVerificationCompleted verifiedSuccess =
  //       (AuthCredential phoneAuthCredential) {
  //     print('verified');
  //   };

  //   final PhoneVerificationFailed veriFailed =
  //       (FirebaseAuthException exception) {
  //     print('${exception.message}');
  //   };

  //   await FirebaseAuth.instance
  //       .verifyPhoneNumber(
  //           phoneNumber: "$number",
  //           codeAutoRetrievalTimeout: autoRetrieve,
  //           codeSent: smsCodeSent,
  //           timeout: const Duration(seconds: 50),
  //           verificationCompleted: verifiedSuccess,
  //           verificationFailed: veriFailed)
  //       .onError((error, stackTrace) {
  //     setState(() {
  //       state = false;
  //     });
  //     return showDialog(
  //       context: context,
  //       builder: (_) => LogoutOverlay(
  //         message: "${error}",
  //       ),
  //     );
  //   });
  // }

  Future<void> SignUpMe() async {
    // await Firebase.initializeApp();
    // FirebaseApp firebaseApp=new FirebaseApp.initialize;
    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential phoneAuthCredential) {
      print('verified');
    };

    final PhoneVerificationFailed verifiFailed =
        (FirebaseAuthException exception) {
      print('${exception.message}');
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationIdFromGoogle = verId;
    };

    ////
    // (String verificationId, int? resendToken) async {
    //         // Update the UI - wait for the user to enter the SMS code
    //         String smsCode = 'xxxx';

    //         // Create a PhoneAuthCredential with the code
    //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //             verificationId: verificationId, smsCode: smsCode);

    //         // Sign the user in (or link) with the credential
    //         await _auth.signInWithCredential(credential);
    //       },
    //       codeAutoRetrievalTimeout: (String verificationId) {
    //         // Auto-resolution timed out...
    //       },
    ///

    final PhoneCodeSent smsCodeSent = (String verId, [int? forceCodeResend]) {
      this.verificationIdFromGoogle = verId;
      print(verId);
      setState(() {
        state = false;
      });

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => OneTimePassword()));
    };

    FirebaseAuth.instance
        .verifyPhoneNumber(
          phoneNumber: phone!,
          verificationCompleted: verifiedSuccess,
          verificationFailed: verifiFailed,
          codeSent: smsCodeSent,
          codeAutoRetrievalTimeout: autoRetrieve,
        )
        .onError((error, stackTrace) => null);
  }

  // void registerMe() {
  //   debugPrint('$email + $password');
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //           email: email!.trim(), password: password!)
  //       .then((value) {
  //     Navigator.pushNamed(context, '/stylistprofile');
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   });
  // }

}
