import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../component/bottomNavBar.dart';
import '../../component/shopping_cart.dart';
import 'widget/wishlist.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
                "Wishlist",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
          ),
          SizedBox(height: 10,),
          // this widget will show the wishlist items
          const Wishlist(),
        ],
        ),
      ),
      ),
      floatingActionButton: const ShoppingCart(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3,),
    );
  }
}
