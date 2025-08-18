import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class MyHomePage extends StatelessWidget {
  final Function(ThemeMode) changerLeTheme;
  final Function(Locale) changerLangue;
  const MyHomePage({
    super.key,
    required this.changerLeTheme,
    required this.changerLangue,
  });
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Raccourci pour traductions
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.chooseGame),
        actions: [
// Sélecteur de langue
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (locale) {
              changerLangue(locale);
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: Locale('fr'), child: Text(" Français 🇫🇷")),
              PopupMenuItem(value: Locale('en'), child: Text(" English 🇺🇸")),
              PopupMenuItem(value: Locale('de'), child: Text(" Deutsch 🇩🇪")),
            ],
          ),
// Sélecteur de thème
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.color_lens),
            tooltip: "Changer le thème",
            onSelected: (ThemeMode modeDuThemeSElectionner) {
              changerLeTheme(modeDuThemeSElectionner);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: ThemeMode.light,
                child: Text("Mode clair 🌞"),
              ),
              const PopupMenuItem(
                value: ThemeMode.dark,
                child: Text("Mode sombre 🌙"),
              ),
              const PopupMenuItem(
                value: ThemeMode.system,
                child: Text("Mode automatique 📱"),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(loc.guessGame),
              onPressed: () {
                Navigator.pushNamed(context, '/devinette_difficulte');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(loc.seerGame),
              onPressed: () {
// Page du jeu clairvoyant
              },
            ),
          ],
        ),
      ),
    );
  }
}
