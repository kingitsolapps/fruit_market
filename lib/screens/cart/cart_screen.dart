import 'package:flutter/material.dart';
import 'package:fruit_market/providers/userLoginProvider.dart';
import 'package:provider/provider.dart';
import '../../models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Consumer<UserSignInProvider>(builder: (context, signInModal, _) {
      return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                "Your Cart",
                // style: TextStyle(color: Colors.black),
              ),
              Text(
                "${demoCarts.length} items",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
        // AppBar(
        //   title:
        //   Text('Your Cart'),
        // ),
        // buildAppBar(context),
        body: Body(),
        bottomNavigationBar: CheckoutCard(),
      );
    }

        // AppBar buildAppBar(BuildContext context) {
        //   return AppBar(
        //     title: Column(
        //       children: [
        //         Text(
        //           "Your Cart",
        //           // style: TextStyle(color: Colors.black),
        //         ),
        //         Text(
        //           "${demoCarts.length} items",
        //           style: Theme.of(context).textTheme.caption,
        //         ),
        //       ],
        //     ),
        //   );
        // },
        );
  }
}
