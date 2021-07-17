import 'package:flutter/material.dart';
import 'package:fruit_market/constants.dart';
import 'package:fruit_market/screens/cart/cart_screen.dart';
import 'package:fruit_market/screens/home/components/icon_btn_with_counter.dart';
import 'package:fruit_market/screens/home/components/search_field.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: Container(
                      height: 100,
                      color: kPrimaryColor,
                    ),
                  ),
                  Container(
                    // color: kPrimaryColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fruit Market',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  IconBtnWithCounter(
                                    svgSrc: "assets/icons/Cart Icon.svg",
                                    press: () => Navigator.pushNamed(
                                        context, CartScreen.routeName),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconBtnWithCounter(
                                    svgSrc: "assets/icons/Bell.svg",
                                    numOfitem: 3,
                                    press: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        SearchField(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              DiscountBanner(),
              Categories(),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
              PopularProducts(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
    );
  }
}
