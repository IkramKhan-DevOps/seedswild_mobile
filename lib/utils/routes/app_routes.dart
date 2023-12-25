import 'package:flutter/material.dart';

import '../../presentation_layer/features/auth/login_screen.dart';
import '../../presentation_layer/features/checkout_screen/checkout_screen.dart';
import '../../presentation_layer/features/complete_screen/complete_screen.dart';
import '../../presentation_layer/features/filter_draweritem/filter_draweritem.dart';
import '../../presentation_layer/features/auth/password_reset_screen.dart';
import '../../presentation_layer/features/home_page/home_page.dart';
import '../../presentation_layer/features/my_cart_page/my_cart_page.dart';
import '../../presentation_layer/features/notifications/notification_screen.dart';
import '../../presentation_layer/features/order_status_screen/myorders_screen.dart';
import '../../presentation_layer/features/product_view_screen/product_view_screen.dart';
import '../../presentation_layer/features/settings/profile_screen.dart';
import '../../presentation_layer/features/settings/settings_screen.dart';
import '../../presentation_layer/features/settings/password_change_screen.dart';
import '../../presentation_layer/features/reviews_page/reviews_page.dart';
import '../../presentation_layer/features/search_page/search_page.dart';
import '../../presentation_layer/features/shop/all_shops.dart';
import '../../presentation_layer/features/shop/shop_screen.dart';
import '../../presentation_layer/features/shop/sub_shops.dart';
import '../../presentation_layer/features/auth/sign_up_screen.dart';
import '../../presentation_layer/features/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';
  static const String profileScreen = '/profile_screen';
  static const String passwordChangeScreen = '/password_change_screen';

  // TODO: remove these
  static const String signInScreen = '/sign_in_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String verificationCodeScreen = '/verification_code_screen';
  static const String shopScreen = '/shop_screen';

  static const String exploreShopScreen = '/explore_shop_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String popularItemsScreen = '/popular_items_screen';

  static const String productViewScreen = '/product_view_screen';

  static const String myCartPage = '/my_cart_page';
  static const String tabReviewScreen = '/tab_bar_review_page';

  static const String checkoutScreen = '/checkout_screen';

  static const String completeScreen = '/complete_screen';

  static const String trackingOrderScreen = '/tracking_order_screen';

  static const String orderStatusScreen = '/order_status_screen';
  static const String orderScreens = '/order_screens';

  static const String reviewsPage = '/reviews_page';
  static const String allShops = '/all_shops';

  static const String reviewsTabContainerScreen =
      '/reviews_tab_container_screen';

  static const String writeAReviewScreen = '/write_a_review_screen';

  static const String searchPage = '/search_page';
  static const String subShop = '/sub_shop';

  static const String notificationScreen = '/notification_screen';

  static const String socialAccountLinkScreen = '/social_account_link_screen';

  static const String settingsScreen = '/settings_screen';
  static const String preLoveProductView = '/pre_love_product_view';
  static const String preLoveScreen = '/pre_love_screen';

  static const String chatScreen = '/chat_screen';
  static const String filterdrawer = '/filterdrawer_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),

    reviewsPage: (context) => ReviewsPage(),
    profileScreen: (context) => ProfileScreen(),
    passwordChangeScreen: (context) => PasswordChangeScreen(),

    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    filterdrawer: (context) => FilterDraweritem(),
    shopScreen: (context) => ShopScreen(),

    homePage: (context) => HomePage(),
    notificationScreen: (context) => NotificationScreen(),
    searchPage: (context) => SearchPage(),
    allShops: (context) => AllShops(),
    tabReviewScreen: (context) => TabContainerScreen(),
    subShop: (context) => SubShopsScreen(),
    // homeContainerScreen: (context) => HomePageContent(),

    productViewScreen: (context) => ProductViewScreen(),
    checkoutScreen: (context) => CheckoutScreen(),
    completeScreen: (context) => CompleteScreen(),

    reviewsTabContainerScreen: (context) => ReviewsTabContainerScreen(),
    settingsScreen: (context) => SettingsScreen(),
    myCartPage: (context) => MyCartPage(),
  };
}
