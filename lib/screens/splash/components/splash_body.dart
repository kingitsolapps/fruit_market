import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../sign_in/sign_in_screen.dart';
import '../../../size_config.dart';
import 'package:get/get.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "E Shopping",
      "text": "Explore top organic fruits & grab them",
      "image": "assets/images/splash_1.png"
    },
    {
      "title": "Delivery on the way",
      "text": "Get your order by speed delivery",
      "image": "assets/images/splash_2.png"
    },
    {
      "title": "Delivery Arrived",
      "text": "Order is arrived at your Place",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: <Widget>[
              Container(
                height: (Get.height) * 0.6,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                    title: splashData[index]['title'],
                  ),
                ),
              ),
              Container(
                height: (Get.height) * 0.358,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(),
                      // DefaultButton(
                      //   text: "Get Started",
                      //   press: () {
                      //     // Navigator.pushNamed(context, SignInScreen.routeName);
                      //   },
                      // ),
                      MaterialButton(
                        onPressed: () {
                          Get.offAll(
                            SignInScreen(),
                          );
                        },
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
