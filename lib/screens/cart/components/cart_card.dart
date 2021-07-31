import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_market/components/default_button.dart';
import 'package:fruit_market/models/Product.dart';
import 'package:fruit_market/providers/userLoginProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    @required this.cart,
    @required this.indexNumber,
  }) : super(key: key);

  final Cart? cart;
  final int? indexNumber;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  String? totalPrice;
  double? totalAmount;
  int? itemValue;
  @override
  void initState() {
    super.initState();
    variableValues();
  }

  variableValues() {
    itemValue = widget.cart!.numOfItem;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSignInProvider>(builder: (context, signInModal, _) {
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: double.infinity,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 100,
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(10)),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(widget.cart!.product!.images![0]),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cart!.product!.title!,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            maxLines: 2,
                          ),
                          // SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              text: "Rs.${widget.cart!.product!.price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),
                              children: [
                                TextSpan(
                                    text: " x$itemValue",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("ToTal= "),

                              // signInModal.resetUnitValue(),
                              Text(
                                signInModal
                                    .priceTotal(
                                      widget.cart!.product!.price,
                                      itemValue!,
                                    )
                                    .toString(),
                              ),

                              // totalPrice = signInModal.priceTotal(
                              //   widget.cart!.product!.price,
                              //   widget.cart!.numOfItem!,
                              // ),
                              // totalAmount = signInModal.amountTotal(totalPrice),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          signInModal.delCartItem(widget.indexNumber);
                          signInModal.resetTotalAmount();
                          // setState(() {
                          //   // print(widget.indexNumber);
                          //   // demoCarts.removeAt(widget.indexNumber!);

                          // });
                        },
                        child: SvgPicture.asset(
                          "assets/icons/Trash.svg",
                          color: kPrimaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                signInModal.resetTotalAmount();
                                // signInModal
                                //     .minusCartItems(widget.cart!.numOfItem!);
                                signInModal.minusCartItems(itemValue!);
                                itemValue = signInModal.itemValue;
                              });
                            },
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
                            width: 30,
                            child: Center(
                              child: Text(itemValue.toString()),
                            ),
                          ),
                          //
                          InkWell(
                            onTap: () {
                              setState(() {
                                signInModal.resetTotalAmount();
                                // itemValue =
                                signInModal.plusCartItems(itemValue!);
                                itemValue = signInModal.itemValue;

                                // plusMethod(widget.cart!.numOfItem);
                              });
                            },
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
                ],
              ),
            ),
          ),
          // ////////start bottom bar
          // ///
          // ///
          // Container(
          //   padding: EdgeInsets.symmetric(
          //     vertical: getProportionateScreenWidth(15),
          //     horizontal: getProportionateScreenWidth(30),
          //   ),
          //   // height: 174,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(30),
          //       topRight: Radius.circular(30),
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         offset: Offset(0, -15),
          //         blurRadius: 20,
          //         color: Color(0xFFDADADA).withOpacity(0.15),
          //       )
          //     ],
          //   ),
          //   child: SafeArea(
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         // Row(
          //         //   children: [
          //         //     Container(
          //         //       padding: EdgeInsets.all(10),
          //         //       height: getProportionateScreenWidth(40),
          //         //       width: getProportionateScreenWidth(40),
          //         //       decoration: BoxDecoration(
          //         //         color: Color(0xFFF5F6F9),
          //         //         borderRadius: BorderRadius.circular(10),
          //         //       ),
          //         //       child: SvgPicture.asset("assets/icons/receipt.svg"),
          //         //     ),
          //         //     Spacer(),
          //         //     Text("Add voucher code"),
          //         //     const SizedBox(width: 10),
          //         //     Icon(
          //         //       Icons.arrow_forward_ios,
          //         //       size: 12,
          //         //       color: kTextColor,
          //         //     )
          //         //   ],
          //         // ),
          //         // SizedBox(height: getProportionateScreenHeight(20)),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text.rich(
          //               TextSpan(
          //                 text: "Total:\n",
          //                 children: [
          //                   TextSpan(
          //                     text:
          //                         // signInModal.totalAmoutOfShoping(0).toString(),
          //                         signInModal.totalamount!.toStringAsFixed(2),
          //                     style:
          //                         TextStyle(fontSize: 16, color: Colors.black),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             SizedBox(
          //               width: getProportionateScreenWidth(180),
          //               child: InkWell(
          //                 onTap: () {
          //                   Get.defaultDialog(middleText: 'Pressed');
          //                 },
          //                 child: DefaultButton(
          //                   text: "Check Out",
          //                   // press: () {},
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // ///
          // ///
          // ///end bottom bar
        ],
      );
    });
  }

  plusMethod(num) {
    num = num + 1;
    return num;
  }
}
