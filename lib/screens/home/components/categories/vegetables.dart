import 'package:flutter/material.dart';
import 'package:fruit_market/models/Product.dart';
import 'package:fruit_market/screens/home/components/categories/category_card.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';

class Vegetables extends StatelessWidget {
  const Vegetables({
    Key? key,
    @required this.category,
  }) : super(key: key);
  final String? category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.7,
      // getProportionateScreenHeight(500),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              category!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SectionTitle(title: "Your Favourits", press: () {}),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...List.generate(
                  demoProducts.length,
                  (index) {
                    if (demoProducts[index].category == category!)
                      return CategoriesCard(product: demoProducts[index]);

                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
