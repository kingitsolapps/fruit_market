import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  final String? phone;
  Body(this.phone);

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
              Text("We sent your code to +92 ${phone}"),
              buildTimer(),
              OtpForm(phone: phone),
              // SizedBox(
              //   height: 51,
              // ),

              //
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
              GestureDetector(
                onTap: () {
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
