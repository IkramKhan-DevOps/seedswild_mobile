import 'package:flutter/material.dart';

import 'cart_model.dart';

class CartProvider with ChangeNotifier{

  final List<Cart> cart = [
    Cart(id: "0", name: "xnxx Premium", category: "Desi", price: "100", quantity: "1", image: "https://i.pinimg.com/236x/03/6b/7e/036b7eae25be123557d54326112e30ea.jpg"),
    Cart(id: "2", name: "redtube", category: "Big Boobs", price: "100", quantity: "2", image: "https://fashionjournal.com.au/wp-content/uploads/2022/10/fashion-journal-bras-things-mob-min.jpeg"),
    Cart(id: "4", name: "Toons", category: "Chinese", price: "100", quantity: "2", image: "https://i.pinimg.com/736x/f8/a3/0d/f8a30df56fe0e897a3b5562f8aa7d374.jpg"),
  ];

  void deleteItem(int index){
    cart.removeAt(index);
    notifyListeners();
  }

}