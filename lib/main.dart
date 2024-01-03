import 'package:seedswild/core/localization/app_localization.dart';
import 'package:seedswild/services/auth/provider/login_provider.dart';
import 'package:seedswild/services/auth/provider/password_reset_provider.dart';
import 'package:seedswild/services/cart/cart_provider.dart';
import 'package:seedswild/services/home/statemanagement/home_provider.dart';
import 'package:seedswild/services/products/provider/notification_provider.dart';
import 'package:seedswild/services/products/provider/product_detail_provider.dart';
import 'package:seedswild/services/products/provider/products_provider.dart';
import 'package:seedswild/services/settings/statemanagement/password_change_provider.dart';
import 'package:seedswild/services/settings/statemanagement/profile_provider.dart';
import 'package:seedswild/services/auth/provider/sign_up_provider.dart';
import 'package:seedswild/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals/providers/general_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  await SharedPreferences.getInstance();
  CartProvider cartProvider = CartProvider();
  GeneralProvider generalProvider = GeneralProvider();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => PasswordChangeProvider()),
        ChangeNotifierProvider(create: (_) => PasswordResetProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => GeneralProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            navigatorKey: NavigatorService.navigatorKey,
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale(
                'en',
                '',
              ),
            ],
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              useMaterial3: true,
              visualDensity: VisualDensity.standard,
            ),
            title: 'seedswild',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
