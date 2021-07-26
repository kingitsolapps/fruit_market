import 'package:flutter/material.dart';
import 'package:fruit_market/screens/home/components/category_home_product.dart';
import 'package:fruit_market/size_config.dart';

import '../categories.dart';
import '../discount_banner.dart';
import '../popular_product.dart';
import '../special_offers.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            // Categories(),
            // SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            CategoryHomeProduct(categoryName: 'Vegetables'),
            SizedBox(height: getProportionateScreenWidth(30)),
            CategoryHomeProduct(categoryName: 'Fruits'),
            SizedBox(height: getProportionateScreenWidth(30)),
            CategoryHomeProduct(categoryName: 'Dry-Fruits'),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
