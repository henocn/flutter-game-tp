import "package:flutter/material.dart";
import 'package:gametp/screens/devinette/guess_game_level.dart';
import 'package:gametp/screens/devinette/nivau_devenette_facile.dart';
import './screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
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
      initialRoute: '/accueil',
      routes: {
        '/accueil':
            (_) => MyHomePage(
              changerLeTheme: (ThemeMode mode) {
              setState(() {
              _themeMode = mode;
              });
              },
            ),
        '/devinette_difficulte' : (_) => const GuessGameMenu(),
        '/devinette_facile' : (_) => const JeuFacilePage()
      },
    );
  }
}
