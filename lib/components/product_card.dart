import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../models/Product.dart';
import '../screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double? width, aspectRetio;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width!),
        child: GestureDetector(
          onTap: () {
            Get.to(DetailsScreen(product: product));
          },

          // () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: ProductDetailsArguments(product: product),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product!.id.toString(),
                    child: Image.asset(product!.images![0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product!.title!,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              /////////////////
              Row(
                children: [
                  // RatingBar.builder(
                  //   tapOnlyMode: ,
                  //   initialRating: 1.2,
                  //   updateOnDrag: false,
                  //   // minRating: 1,
                  //   direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  //   itemCount: 5,
                  //   // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  //   itemBuilder: (context, _) => Icon(
                  //     Icons.star,
                  //     color: Colors.amber,
                  //     size: 5,
                  //   ),
                  //   onRatingUpdate: (rating) {
                  //     print(rating);
                  //   },
                  // ),
                  RatingBarIndicator(
                    rating: product!.rating!,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              ///////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs.${product!.price} /Kg",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: product!.isFavourite!
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product!.isFavourite!
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
