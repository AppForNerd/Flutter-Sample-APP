import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:appfornerds/theme.dart';
import 'package:appfornerds/routes.dart';
import 'package:appfornerds/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Growy',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
      supportedLocales: [
        // Locale("af"),
        // Locale("am"),
        // Locale("ar"),
        // Locale("az"),
        // Locale("be"),
        // Locale("bg"),
        // Locale("bn"),
        // Locale("bs"),
        // Locale("ca"),
        // Locale("cs"),
        // Locale("da"),
        // Locale("de"),
        // Locale("el"),
        Locale("en"),
        // Locale("es"),
        // Locale("et"),
        // Locale("fa"),
        // Locale("fi"),
        // Locale("fr"),
        // Locale("gl"),
        // Locale("ha"),
        // Locale("he"),
        // Locale("hi"),
        // Locale("hr"),
        // Locale("hu"),
        // Locale("hy"),
        // Locale("id"),
        // Locale("is"),
        // Locale("it"),
        // Locale("ja"),
        // Locale("ka"),
        // Locale("kk"),
        // Locale("km"),
        // Locale("ko"),
        // Locale("ku"),
        // Locale("ky"),
        // Locale("lt"),
        // Locale("lv"),
        // Locale("mk"),
        // Locale("ml"),
        // Locale("mn"),
        // Locale("ms"),
        // Locale("nb"),
        // Locale("nl"),
        // Locale("nn"),
        // Locale("no"),
        // Locale("pl"),
        // Locale("ps"),
        // Locale("pt"),
        // Locale("ro"),
        // Locale("ru"),
        // Locale("sd"),
        // Locale("sk"),
        // Locale("sl"),
        // Locale("so"),
        // Locale("sq"),
        // Locale("sr"),
        // Locale("sv"),
        // Locale("ta"),
        // Locale("tg"),
        // Locale("th"),
        // Locale("tk"),
        // Locale("tr"),
        // Locale("tt"),
        // Locale("uk"),
        // Locale("ug"),
        // Locale("ur"),
        // Locale("uz"),
        // Locale("vi"),
        // Locale("zh")
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
