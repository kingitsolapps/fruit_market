import 'package:flutter/material.dart';
import 'package:fruit_market/constants.dart';
import 'package:fruit_market/screens/cart/cart_screen.dart';
import 'package:fruit_market/screens/favourite/favourite_screen.dart';
import 'package:fruit_market/screens/home/components/categories/dry_fruits.dart';
import 'package:fruit_market/screens/home/components/categories/fruits.dart';
import 'package:fruit_market/screens/home/components/categories/home.dart';
import 'package:fruit_market/screens/home/components/categories/vegetables.dart';
import 'package:fruit_market/screens/home/components/icon_btn_with_counter.dart';
import 'package:fruit_market/screens/home/components/search_field.dart';
import 'package:fruit_market/screens/home/home_screen.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'popular_product.dart';
import 'special_offers.dart';
import 'package:category_picker/category_picker.dart';
import 'package:category_picker/category_picker_item.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String pagevalue = 'Home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: Container(
                      height: 50,
                      color: kPrimaryColor,
                    ),
                  ),
                  Container(
                    // color: kPrimaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.all(10.0),
                        //   child:
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        SearchField(),
                      ],
                    ),
                  ),
                ],
              ),
              CategoryPicker(
                items: [
                  CategoryPickerItem(
                    value: 'Home',
                    label: 'Home',
                  ),
                  CategoryPickerItem(
                    value: 'Vegetables',
                    label: 'Vegetables',
                  ),
                  CategoryPickerItem(
                    value: 'Fruits',
                    label: 'Fruits',
                  ),
                  CategoryPickerItem(
                    value: 'Dry-Fruits',
                    label: 'Dry-Fruits',
                  ),
                ],
                defaultSelected: 0,
                onValueChanged: (value) {
                  print(value.label);
                  setState(() {
                    pagevalue = value.label;
                  });
                },
                backgroundColor: Colors.transparent,
                selectedItemColor: kPrimaryColor,
                unselectedItemColor: Colors.grey,
                selectedItemBorderColor: Colors.transparent,
                unselectedItemBorderColor: Colors.grey[800],
                selectedItemTextDarkThemeColor: Colors.white,
                selectedItemTextLightThemeColor: Colors.black,
                unselectedItemTextDarkThemeColor: Colors.white,
                unselectedItemTextLightThemeColor: Colors.white,
                itemBorderRadius: BorderRadius.circular(30),
                itemHeight: 32.0,
                itemLabelFontSize: 16.0,
                categoryPickerMargin: const EdgeInsets.symmetric(vertical: 11),
                categoryPickerPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemMargin: const EdgeInsets.symmetric(horizontal: 4),
                itemPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              if (pagevalue == 'Home')
                Home()
              else if (pagevalue == 'Vegetables')
                Vegetables()
              else if (pagevalue == 'Fruits')
                Fruits()
              else if (pagevalue == 'Dry-Fruits')
                DryFruits()
            ],
          ),
        ),
      ),
    );
  }
}
