import 'package:ecommerce_app_ui/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:lordicon/lordicon.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    var iconEmptyController = IconController.assets('assets/images/icons/basket-hover-oscillate-empty.json');

    iconEmptyController.addStatusListener((status) {
      if (status == ControllerStatus.ready) {
        iconEmptyController.playFromBeginning();
      } else if (status == ControllerStatus.completed) {
        iconEmptyController.playFromBeginning();
      }
    });

    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Cart',
              style: TextStyle(
                fontWeight:  FontWeight.bold,
                fontSize: 24
              ),
            ),

            SizedBox(height: 10),

            Expanded(
              child: value.getUserCart().isEmpty ?
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconViewer(
                            controller: iconEmptyController,
                            width: 80,
                            height: 80,
                            // colorize: Colors.red,
                          ),

                          SizedBox(height: 20),

                          Text('Your cart is empty!',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      )
                    ),
                  )
                  : ListView.builder(
                    itemCount: value.getUserCart().length,
                    itemBuilder: (context, index) {
                      Shoe individualShoe = value.getUserCart()[index];
                      return CartItem(shoe: individualShoe);
                    },
                  ),
            )
          ],
        ),
      ),
    );
  }
}
