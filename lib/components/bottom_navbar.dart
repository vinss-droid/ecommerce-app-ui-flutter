import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbarGoogle extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavbarGoogle({
    super.key,
    required this.onTabChange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Shop',
            gap: 8,
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
            gap: 8,
          ),
        ],
      ),
    );
  }
}
