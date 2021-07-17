import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final Product? product;
  DetailsScreen({Key? key, @required this.product});

  @override
  Widget build(BuildContext context) {
    final Object? agrs = ModalRoute.of(context)!.settings.arguments;
    // var product;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(rating: agrs!.product!.rating!),
      body: Body(product: product),
    );
  }
}

class ProductDetailsArguments {
  final Product? product;

  ProductDetailsArguments({@required this.product});
}
