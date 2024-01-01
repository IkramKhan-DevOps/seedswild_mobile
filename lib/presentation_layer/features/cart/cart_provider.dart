import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_model.dart';

class CartProvider with ChangeNotifier {

  // CART VARIABLES ------------------------------------------------------------
  num total = 0.0;
  num subTotal = 0.0;
  num deliveryCharges = 0.0;
  final List<Cart> _cart = [];
  List<Cart> get cart => _cart;

  // PROVIDER INITIALIZATION ---------------------------------------------------
  CartProvider() {
    _loadCartFromStorage();
  }

  // CART METHODS --------------------------------------------------------------

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

  void clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('cart');
    _cart.clear();
    calculate();
    notifyListeners();
  }

  // CHECKS AND CALCULATIONS ---------------------------------------------------

  bool doesCartItemExist(String id) {
    return cart.any((cartItem) => cartItem.id == id);
  }

  void calculate(){
    if(cart.length > 0){
      num _totalCharges = 0;
      for(Cart item in cart){
        _totalCharges += item.quantity * item.price;
      }
      total = double.parse(_totalCharges.toStringAsFixed(2));
      subTotal = double.parse((total + deliveryCharges).toStringAsFixed(2));
    }else{
      total = 0.0;
      subTotal = 0.0;
    }
  }

  // ASYNC STORAGE METHODS -----------------------------------------------------

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
