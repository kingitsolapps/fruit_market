import 'package:flutter/material.dart';
import 'package:fruit_market/screens/profile/pages/order_card.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderCard(),
            OrderCard(),
            OrderCard(),
            OrderCard(),
            OrderCard(),
            OrderCard(),
            OrderCard(),
          ],
        ),
      ),
    );
  }
}
