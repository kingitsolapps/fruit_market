import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/Product.dart';
import '../../../screens/details/details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class FavouritCard extends StatefulWidget {
  const FavouritCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.0,
    @required this.product,
  }) : super(key: key);

  final double? width, aspectRetio;
  final Product? product;

  @override
  _FavouritCardState createState() => _FavouritCardState();
}

class _FavouritCardState extends State<FavouritCard> {
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
        // Dismissible(
        //   key: Key(widget.product!.id.toString()),
        //   direction: DismissDirection.endToStart,
        //   onDismissed: (direction) {
        //     setState(() {
        //       // demoCarts.removeAt(index);
        //       // widget.product!.isFavourite != false;
        //       demoProducts.removeAt(key);
        //     });
        //   },
        //   background: Container(
        //     padding: EdgeInsets.symmetric(horizontal: 20),
        //     decoration: BoxDecoration(
        //       color: Color(0xFFFFE6E6),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Row(
        //       children: [
        //         Spacer(),
        //         SvgPicture.asset("assets/icons/Trash.svg"),
        //       ],
        //     ),
        //   ),
        //   child:
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: SizedBox(
            // width: getProportionateScreenWidth(width!),
            // width: (Get.width) - 50,
            height: 100,
            child: GestureDetector(
              onTap: () {
                Get.to(DetailsScreen(product: widget.product));
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
                              tag: widget.product!.id.toString(),
                              child: Image.asset(widget.product!.images![0]),
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
                              widget.product!.title!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              // maxLines: 2,
                            ),
                            Container(
                              width: Get.width / 2,
                              child: Text(
                                widget.product!.description!,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            RatingBarIndicator(
                              rating: widget.product!.rating!,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                            Text(
                              "Rs.${widget.product!.price} /Kg",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       width: 30,
                            //       height: 30,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(5),
                            //         border: Border.all(
                            //           color: Colors.grey,
                            //           width: 1,
                            //         ),
                            //       ),
                            //       child: Center(
                            //           child: Text(
                            //         '-',
                            //         style: TextStyle(
                            //           fontSize: 20,
                            //         ),
                            //       )),
                            //     ),
                            //     //
                            //     Container(
                            //       height: 30,
                            //       width: 30,
                            //       child: Center(
                            //         child: Text("1"),
                            //       ),
                            //     ),
                            //     //
                            //     InkWell(
                            //       onTap: () {},
                            //       child: Container(
                            //         width: 30,
                            //         height: 30,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(5),
                            //           border: Border.all(
                            //             color: Colors.grey,
                            //             width: 1,
                            //           ),
                            //         ),
                            //         child: Center(
                            //           child: Text(
                            //             '+',
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
                          onTap: () {
                            setState(() {
                              print(widget.product!.isFavourite);
                              final productId = widget.product!.id;
                              changeFavourit(
                                widget.product!.id,
                                widget.product!.isFavourite,
                                widget.product!.category,
                                widget.product!.title,
                              );
                            });
                          },
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(8)),
                            height: getProportionateScreenWidth(30),
                            width: getProportionateScreenWidth(30),
                            decoration: BoxDecoration(
                              color: widget.product!.isFavourite!
                                  ? kPrimaryColor.withOpacity(0.15)
                                  : kSecondaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Heart Icon_2.svg",
                              color: widget.product!.isFavourite!
                                  ? Color(0xFFFF4848)
                                  : Color(0xFFDBDEE4),
                            ),
                          ),
                        ),
                        // MaterialButton(
                        //   onPressed: () {},
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(5),
                        //   ),
                        //   color: kPrimaryColor,
                        //   child: Text(
                        //     'Add',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // ),
      ],
    );
  }

  void changeFavourit(
    int? id,
    bool? isFavourite,
    String? category,
    String? title,
  ) {
    final newFv = Product(
      id: id,
      isFavourite: isFavourite,
      category: category,
      title: title,
    );
    setState(() {
      // demoProducts.re;
    });

    // void addToCart(int index, int numOfIndex) {
    // final newTx = Cart(
    //   product: demoProducts[index - 1],
    //   numOfItem: numOfIndex,
    // );
    // setState(() {
    //   demoCarts.add(newTx);
  }
}
