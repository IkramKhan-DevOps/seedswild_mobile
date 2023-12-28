import 'package:annafi_app/core/localization/app_localization.dart';
import 'package:annafi_app/presentation_layer/features/auth/provider/login_provider.dart';
import 'package:annafi_app/presentation_layer/features/auth/provider/password_reset_provider.dart';
import 'package:annafi_app/presentation_layer/features/home_page/statemanagement/home_provider.dart';
import 'package:annafi_app/presentation_layer/features/products/provider/products_provider.dart';
import 'package:annafi_app/presentation_layer/features/settings/statemanagement/password_change_provider.dart';
import 'package:annafi_app/presentation_layer/features/settings/statemanagement/profile_provider.dart';
import 'package:annafi_app/presentation_layer/features/auth/provider/sign_up_provider.dart';
import 'package:annafi_app/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
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
        ],
        child: Builder(builder: (BuildContext context) {
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
        }));
  }
}
