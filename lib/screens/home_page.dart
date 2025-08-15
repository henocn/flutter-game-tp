import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final Function(ThemeMode) changerLeTheme;
  const MyHomePage({
    super.key,
    required this.changerLeTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choisir le jeu"),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.color_lens),
            tooltip: "Changer le thème",
            onSelected: (ThemeMode modeDuThemeSElectionner) {
            changerLeTheme(modeDuThemeSElectionner
             ); // appelle la fonction
            },
            itemBuilder:
                (BuildContext context) => const [
                  PopupMenuItem(
                    value: ThemeMode.light,
                    child: Text("Mode clair "),
                  ),
                  PopupMenuItem(
                    value: ThemeMode.dark,
                    child: Text("Mode sombre "),
                  ),
                  PopupMenuItem(
                    value: ThemeMode.system,
                    child: Text("Mode automatique "),
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
              child: const Text("Jeu devinette"),
              onPressed: () {
                Navigator.pushNamed(context, '/devinette_difficulte'); 
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Jeu clairvoyant"),
              onPressed: () {
                // page qui mène à la logique du jeu clairvoyant
              },
            ),
          ],
        ),
      ),
    );
  }
}
