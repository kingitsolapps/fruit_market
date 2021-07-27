import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/Product.dart';
import '../../../screens/details/details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FavouritCard extends StatelessWidget {
  const FavouritCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.0,
    @required this.product,
  }) : super(key: key);

  final double? width, aspectRetio;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1,
          width: double.infinity,
          child: Container(
            color: Colors.grey.shade500,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: SizedBox(
            // width: getProportionateScreenWidth(width!),
            // width: (Get.width) - 50,
            height: 100,
            child: GestureDetector(
              onTap: () {
                Get.to(DetailsScreen(product: product));
              },

              // () => Navigator.pushNamed(
              //   context,
              //   DetailsScreen.routeName,
              //   arguments: ProductDetailsArguments(product: product),
              // ),
              child: Container(
                // color: Colors.grey.shade400,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.grey.shade200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(20)),
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
                        const SizedBox(
                          width: 10,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product!.title!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                            RatingBarIndicator(
                              rating: product!.rating!,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                            Text(
                              "Rs.${product!.price} /Kg",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )),
                                ),
                                //
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Center(
                                    child: Text("1"),
                                  ),
                                ),
                                //
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 50,
                        // ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(8)),
                            height: getProportionateScreenWidth(30),
                            width: getProportionateScreenWidth(30),
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
                        MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: kPrimaryColor,
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
