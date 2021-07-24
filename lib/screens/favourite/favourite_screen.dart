import 'package:flutter/material.dart';
import 'package:fruit_market/components/coustom_bottom_nav_bar.dart';
import './components/body.dart';

import '../../enums.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
