import 'package:seedswild/presentation_layer/features/cart/cart_screen.dart';
import 'package:seedswild/presentation_layer/features/products/products_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation_layer/features/auth/login_screen.dart';
import '../../presentation_layer/features/orders/checkout_screen.dart';
import '../../presentation_layer/features/orders/complete_screen.dart';
import '../../presentation_layer/features/auth/password_reset_screen.dart';
import '../../presentation_layer/features/home_page/home_page.dart';
import '../../presentation_layer/features/products/product_detail_screen.dart';
import '../../presentation_layer/features/settings/notifications_screen.dart';
import '../../presentation_layer/features/settings/profile_screen.dart';
import '../../presentation_layer/features/settings/settings_screen.dart';
import '../../presentation_layer/features/settings/password_change_screen.dart';
import '../../presentation_layer/features/auth/sign_up_screen.dart';
import '../../presentation_layer/features/splash/splash_screen.dart';

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

    // CLEANING REQUIRED
    checkoutScreen: (context) => CheckoutScreen(),
    completeScreen: (context) => CompleteScreen(),

  };
}
