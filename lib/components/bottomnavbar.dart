import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class MYBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
 MYBottomNavBar({super.key,
  required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: GNav(
        onTabChange: onTabChange,
        color: Colors.grey.shade400,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey.shade700,
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: [
          GButton(icon: Icons.home,text: 'Shop',),
          GButton(icon: Icons.shopping_cart,text: 'Cart',),
        ],
      ),
    );
  }
}