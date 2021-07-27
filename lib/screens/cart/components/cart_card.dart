import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    @required this.cart,
  }) : super(key: key);

  final Cart? cart;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cart!.product!.title!,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          maxLines: 2,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text: "Rs.${widget.cart!.product!.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                            children: [
                              TextSpan(
                                  text: " x${widget.cart!.numOfItem}",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/Trash.svg",
                        color: kPrimaryColor,
                      ),
                    ),
                    Row(
                      children: [
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
                            child: Text("${widget.cart!.numOfItem}"),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
