import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import './niveau_devenette_facile.dart';

class GuessGameMenu extends StatelessWidget {
  const GuessGameMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Récupération des traductions
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.guessGame), // "Jeu devinette"
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
                      title: Text(loc.changeLanguage),
                      onTap: () {
// Ici, tu peux ouvrir un Popup ou écran pour changer la langue
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.bar_chart),
                      title: Text(loc.viewScores),
                      onTap: () {
                        Navigator.pop(context);
// Naviguer vers l'écran des scores
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.refresh),
                      title: Text(loc.resetGame),
                      onTap: () {
// Ajouter ta logique de réinitialisation ici
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: Text(loc.quit),
                      onTap: () {
// Fermer l'application ou revenir à l'accueil
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        actions: const [
// Tu peux ajouter ici un bouton langue ou autre action
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NiveauFacile()),
                );
              },
              child: Text(loc.easyLevel), // "Niveau facile"
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(loc.mediumLevel), // "Niveau moyen"
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(loc.hardLevel), // "Niveau difficile"
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: Text(loc.homeTitle), // "Accueil"
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
