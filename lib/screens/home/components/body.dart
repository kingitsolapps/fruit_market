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
                      height: 50,
                      color: kPrimaryColor,
                    ),
                  ),
                  Container(
                    // color: kPrimaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.all(10.0),
                        //   child:
                        // ),
                        SizedBox(
                          height: 20,
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
