import 'package:flutter/material.dart';

class GuessGameMenu extends StatelessWidget {
  const GuessGameMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jeu devinette"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Affichage d’un menu sous forme de BottomSheet
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.translate),
                      title: const Text("Changer la langue"),
                      onTap: () {
                        // Navigation vers un écran ou popup pour changer la langue
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.bar_chart),
                      title: const Text("Voir les Scores"),
                      onTap: () {
                        Navigator.pop(context);
                        // Naviguer vers l'écran des scores
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.refresh),
                      title: const Text("Reinitialiser le jeu"),
                      onTap: () {
                        // Ajouter ta logique de réinitialisation ici
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text("Quitter"),
                      onTap: () {
                        // Fermer l'application ou revenir à l'écran d’accueil
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'devinette_facile');
              },
              child: const Text("Niveau facile"),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Niveau moyen")),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Niveau difficile"),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Retour au menu'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
