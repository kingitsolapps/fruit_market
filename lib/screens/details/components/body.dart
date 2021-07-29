import 'package:flutter/material.dart';
import 'package:fruit_market/models/Cart.dart';
import 'package:fruit_market/providers/userLoginProvider.dart';
import 'package:fruit_market/screens/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product? product;

  const Body({Key? key, @required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserSignInProvider>(builder: (context, signInModal, _) {
      return Column(
        children: [
          SizedBox(
            height: Get.height - 50,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                ProductImages(product: widget.product),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ProductDescription(
                        product: widget.product,
                        pressOnSeeMore: () {},
                      ),
                      TopRoundedContainer(
                        color: Color(0xFFF6F7F9),
                        child: Column(
                          children: [
                            // ColorDots(product: product),
                            Text(
                              "Rs.${widget.product!.price} /Kg",
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
                                  top: getProportionateScreenWidth(10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              signInModal.minusUnitValue();
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                        ),
                                        //
                                        Container(
                                          height: 30,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              signInModal.unitValue.toString(),
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        //
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              signInModal.plusUnitValue();
                                            });
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.product!.price} x ${signInModal.unitValue}',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
            ),
          ),
          Container(
            color: Colors.white,
            height: 50,
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width / 2,
                    child: Column(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          (widget.product!.price!.toDouble() *
                                  signInModal.unitValue)
                              .toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      addToCart(widget.product!.id!, signInModal.unitValue);
                      signInModal.resetUnitValue();
                    },
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
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  void addToCart(int index, int numOfIndex) {
    final newTx = Cart(
      product: demoProducts[index - 1],
      numOfItem: numOfIndex,
    );
    setState(() {
      demoCarts.add(newTx);
      // Get.defaultDialog(actions: []);
      Get.defaultDialog(
          middleText:
              'product name : ${demoProducts[index - 1].title} \n num ofiterms: $numOfIndex \n has been added successfully',
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  child: Text('Close'),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.off(CartScreen());
                  },
                  color: Colors.green,
                  child: Text('Check Card'),
                )
              ],
            )
          ]);
    });
  }
}
