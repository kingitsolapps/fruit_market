import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product? product;

  const Body({Key? key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    // ColorDots(product: product),
                    Text(
                      "Rs.${product!.price} /Kg",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth! * 0.15,
                            right: SizeConfig.screenWidth! * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            color: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                          // DefaultButton(
                          //   text: "Add To Cart",
                          //   press: () {},
                          // ),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
