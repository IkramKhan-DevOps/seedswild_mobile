import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_model.dart';

class CartProvider with ChangeNotifier {

  num total = 500;
  num subTotal = 500;
  num deliveryCharges = 0;

  final List<Cart> _cart = [];
  List<Cart> get cart => _cart;

  CartProvider() {
    _loadCartFromStorage();
  }

  bool doesCartItemExist(String id) {
    return cart.any((cartItem) => cartItem.id == id);
  }

  void addToCart(Cart _cart){
    cart.add(_cart);
    _saveCartToStorage();
    notifyListeners();
  }

  void deleteItem(int index) {
    cart.removeAt(index);
    calculate();
    _saveCartToStorage();
    notifyListeners();
  }

  void calculate(){
    num _totalCharges = 0;
    for(Cart item in cart){
      _totalCharges += item.quantity * item.price;
    }
    total = double.parse(_totalCharges.toStringAsFixed(2));
    subTotal = double.parse((total + deliveryCharges).toStringAsFixed(2));
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
    _saveCartToStorage();
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
      _saveCartToStorage();
    }
    notifyListeners();
  }

  void _saveCartToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = cart.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('cart', cartJson);
  }

  void _loadCartFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      _cart.clear();
      _cart.addAll(cartJson.map((json) => Cart.fromJson(jsonDecode(json))));
      notifyListeners();
    }
  }

}
