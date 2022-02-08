import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:three4two/Start.dart';
import 'package:three4two/Home.dart';
import 'package:three4two/Thanks.dart';
import 'package:three4two/OwnTransactions.dart';
import 'package:flutter/material.dart';
import 'package:three4two/about.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three4two/api/purchase_api.dart';
import 'package:three4two/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PurchaseApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.pink,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.pink,
                displayColor: Colors.pink,
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.pink,
            primary: Colors.red[50],
            elevation: 2,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: '342',
      initialRoute: "/",
      routes: {
        "/": (context) => Screen0(),
        "/home": (context) => Home(),
        "/search": (context) => OwnTx(),
        "/about": (context) => About(),
        "/thanks": (context) => Thanks(),
      },
    );
  }
}
