import 'package:flutter/material.dart';

import '../../presentation_layer/features/checkout_screen/checkout_screen.dart';
import '../../presentation_layer/features/complete_screen/complete_screen.dart';
import '../../presentation_layer/features/discount_screen/discount_screen.dart';
import '../../presentation_layer/features/filter_draweritem/filter_draweritem.dart';
import '../../presentation_layer/features/forgot_password_screen/forgot_password_screen.dart';
import '../../presentation_layer/features/home_page/home_page.dart';
import '../../presentation_layer/features/home_page/pre_loved/pre_loved_screen.dart';
import '../../presentation_layer/features/my_cart_page/my_cart_page.dart';
import '../../presentation_layer/features/notifications/notification_screen.dart';
import '../../presentation_layer/features/onbording_screens/onbording_one_screen.dart';
import '../../presentation_layer/features/onbording_screens/onbording_three_screen.dart';
import '../../presentation_layer/features/onbording_screens/onbording_two_screen.dart';
import '../../presentation_layer/features/order_status_screen/myorders_screen.dart';
import '../../presentation_layer/features/product_view_screen/pre_love_product_view.dart';
import '../../presentation_layer/features/product_view_screen/product_view_screen.dart';
import '../../presentation_layer/features/profile_page/info_data.dart';
import '../../presentation_layer/features/profile_page/profile_page.dart';
import '../../presentation_layer/features/reset_password_screen/reset_password_screen.dart';
import '../../presentation_layer/features/reviews_page/reviews_page.dart';
import '../../presentation_layer/features/search_page/search_page.dart';
import '../../presentation_layer/features/settings_screen/settings_screen.dart';
import '../../presentation_layer/features/shop/all_shops.dart';
import '../../presentation_layer/features/shop/shop_screen.dart';
import '../../presentation_layer/features/shop/sub_shops.dart';
import '../../presentation_layer/features/sign_in/sign_in_screen.dart';
import '../../presentation_layer/features/sign_up_screen/sign_up_screen.dart';
import '../../presentation_layer/features/sign_up_sign_in_screen/sign_up_sign_in_screen.dart';
import '../../presentation_layer/features/splash_screen/splash_screen.dart';
import '../../presentation_layer/features/verification_code_screen/verification_code_screen.dart';
import '../../presentation_layer/features/write_a_review_screen/write_a_review_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onbordingOneScreen = '/onbording_one_screen';

  static const String onbordingTwoScreen = '/onbording_two_screen';

  static const String onbordingThreeScreen = '/onbording_three_screen';

  static const String signUpSignInScreen = '/sign_up_sign_in_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String informationScreen = '/information_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verificationCodeScreen = '/verification_code_screen';

  static const String resetPasswordScreen = '/reset_password_screen';
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

  static const String settingsScreen = '/settings_screen';

  static const String searchPage = '/search_page';
  static const String subShop = '/sub_shop';

  static const String notificationScreen = '/notification_screen';

  static const String discountItemsScreen = '/discount_items_screen';

  static const String socialAccountLinkScreen = '/social_account_link_screen';

  static const String profilePage = '/profile_page';
  static const String preLoveProductView = '/pre_love_product_view';
  static const String preLoveScreen = '/pre_love_screen';

  static const String chatScreen = '/chat_screen';
  static const String filterdrawer = '/filterdrawer_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    onbordingOneScreen: (context) => OnbordingOneScreen(),
    onbordingTwoScreen: (context) => OnbordingTwoScreen(),
    onbordingThreeScreen: (context) => OnbordingThreeScreen(),
    signUpSignInScreen: (context) => SignUpSignInScreen(),
    signInScreen: (context) => SignInScreen(),
    signUpScreen: (context) => SignUpScreen(),
    reviewsPage: (context) => ReviewsPage(),
    informationScreen: (context) => InformationScreen(),
    preLoveProductView: (context) => PreLovedViewScreen(),
    preLoveScreen: (context) => PreLovedScreen(),

    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    verificationCodeScreen: (context) => Otp(),
    filterdrawer: (context) => FilterDraweritem(),
    resetPasswordScreen: (context) => ResetPasswordScreen(),
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
    writeAReviewScreen: (context) => WriteAReviewScreen(),
    settingsScreen: (context) => SettingsScreen(),
    discountItemsScreen: (context) => DiscountItemsScreen(),

    profilePage: (context) => ProfilePage(),

    myCartPage: (context) => MyCartPage(),
  };
}
