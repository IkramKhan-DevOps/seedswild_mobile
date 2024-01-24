import 'package:seedswild/services/cart/cart_screen.dart';
import 'package:seedswild/services/orders/orders_screen.dart';
import 'package:seedswild/services/products/products_screen.dart';
import 'package:flutter/material.dart';

import '../../services/auth/login_screen.dart';
import '../../services/orders/checkout_screen.dart';
import '../../services/orders/complete_screen.dart';
import '../../services/auth/password_reset_screen.dart';
import '../../services/home/home_page.dart';
import '../../services/orders/order_detail_screen.dart';
import '../../services/products/product_detail_screen.dart';
import '../../services/settings/notifications_screen.dart';
import '../../services/settings/profile_screen.dart';
import '../../services/settings/settings_screen.dart';
import '../../services/settings/password_change_screen.dart';
import '../../services/auth/sign_up_screen.dart';
import '../../services/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String signUpScreen = '/sign_up_screen';

  static const String profileScreen = '/profile_screen';
  static const String passwordChangeScreen = '/password_change_screen';
  static const String notificationScreen = '/notification_screen';

  static const String productsScreen = "/products_screen";
  static const String productDetailScreen = '/product_detail_screen';
  static const String cartScreen = '/cart_screen';

  static const String ordersScreen = '/orders_screen';
  static const String orderDetailScreen = '/order_detail_screen';

  // TODO: tests
  static const String checkoutScreen = '/checkout_screen';
  static const String completeScreen = '/complete_screen';

  // TODO: remove these
  static const String homePage = '/home_page';
  static const String settingsScreen = '/settings_screen';


  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),

    homePage: (context) => HomePage(),
    productsScreen: (context) => ProductsScreen(),
    productDetailScreen: (context) => ProductDetailScreen(productId: '1'),
    cartScreen: (context) => CartScreen(),

    settingsScreen: (context) => SettingsScreen(),
    profileScreen: (context) => ProfileScreen(),
    passwordChangeScreen: (context) => PasswordChangeScreen(),
    notificationScreen: (context) => NotificationScreen(),

    ordersScreen: (context) => OrdersScreen(),
    orderDetailScreen: (context) => OrderDetailScreen(orderId: '1'),

    // CLEANING REQUIRED
    checkoutScreen: (context) => CheckoutScreen(),
    completeScreen: (context) => CompleteScreen(),

  };
}
