import 'package:flutter/material.dart';

import 'cart_model.dart';

class CartProvider with ChangeNotifier {

  num total = 500;
  num subTotal = 500;
  num deliveryCharges = 0;

  List<Cart> cart = [
    Cart(
        id: "0",
        name: "xnxx Premium",
        category: "Desi",
        price: 100,
        quantity: 1,
        image:
            "https://i.pinimg.com/236x/03/6b/7e/036b7eae25be123557d54326112e30ea.jpg"),
    Cart(
        id: "1",
        name: "red tube",
        category: "Big Boobs",
        price: 100,
        quantity: 2,
        image:
            "https://fashionjournal.com.au/wp-content/uploads/2022/10/fashion-journal-bras-things-mob-min.jpeg"),
    Cart(
        id: "2",
        name: "Toons",
        category: "Chinese",
        price: 100,
        quantity: 2,
        image:
            "https://i.pinimg.com/736x/f8/a3/0d/f8a30df56fe0e897a3b5562f8aa7d374.jpg"),
  ];

  bool doesCartItemExist(String id) {
    return cart.any((cartItem) => cartItem.id == id);
  }

  void addToCart(Cart _cart){
    cart.add(_cart);
    notifyListeners();
  }


  void deleteItem(int index) {
    print(index);
    cart.removeAt(index);
    calculate();
    notifyListeners();
  }

  void calculate(){
    num _totalCharges = 0;
    for(Cart item in cart){
      _totalCharges += item.quantity * item.price;
    }
    total = _totalCharges;
    subTotal = total + deliveryCharges;
  }

  void increaseItem(int index) {
    Cart item = Cart(
      id: cart[index].id,
      name: cart[index].name,
      category: cart[index].category,
      price: cart[index].price,
      quantity: cart[index].quantity + 1,
      image: cart[index].image
    );
    cart[index] = item;
    calculate();
    notifyListeners();
  }

  void decreaseItem(int index) {
    int qty = cart[index].quantity;
    if (qty > 1) {
      Cart item = Cart(
          id: cart[index].id,
          name: cart[index].name,
          category: cart[index].category,
          price: cart[index].price,
          quantity: cart[index].quantity - 1,
          image: cart[index].image
      );
      cart[index] = item;
      calculate();
    }
    notifyListeners();
  }
}
