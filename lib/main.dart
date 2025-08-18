import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './l10n/app_localizations.dart';
import './screens/home_page.dart';
import './screens/devinette/home_devintte_game.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Initialisation pour Windows/Linux/macOS
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // par défaut
  Locale _locale = const Locale('fr'); // langue par défaut
  void _changerLangue(Locale nouvelleLangue) {
    setState(() {
      _locale = nouvelleLangue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Thème clair
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      // Thème sombre
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark,
      ),
      // Applique le mode choisi
      themeMode: _themeMode,
      // Localisation
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Texte traduit
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fr'), Locale('en'), Locale('de')],
      initialRoute: '/accueil',
      routes: {
        '/accueil':
            (_) => MyHomePage(
              changerLeTheme: (ThemeMode mode) {
                setState(() {
                  _themeMode = mode;
                });
              },
              changerLangue: _changerLangue,
            ),
        '/devinette_difficulte': (_) => const GuessGameMenu(),
      },
    );
  }
}
