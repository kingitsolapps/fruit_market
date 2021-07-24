import 'package:flutter/material.dart';
import 'package:fruit_market/components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat to Admin'),
      ),
      body: ChatPage(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
