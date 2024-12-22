import 'package:ecommerce_app_ui/models/shoe.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {

  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: 236,
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'assets/images/shoes/shoes_2.png'
    ),
    Shoe(
      name: 'Air Jordans',
      price: 220,
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'assets/images/shoes/shoes_1.png'
    ),
    Shoe(
      name: 'KD Trey',
      price: 290,
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'assets/images/shoes/shoes_3.png'
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeLists() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

}