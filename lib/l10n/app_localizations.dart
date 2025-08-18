import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  const AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const supportedLocales = [
    Locale('fr'),
    Locale('en'),
    Locale('de'),
  ];

  String get guessGame {
    switch (locale.languageCode) {
      case 'en':
        return 'Guess game';
      case 'de':
        return 'Ratespiel';
      default:
        return 'Jeu devinette';
    }
  }

  String get changeLanguage {
    switch (locale.languageCode) {
      case 'en':
        return 'Change language';
      case 'de':
        return 'Sprache ändern';
      default:
        return 'Changer la langue';
    }
  }

  String get viewScores {
    switch (locale.languageCode) {
      case 'en':
        return 'View scores';
      case 'de':
        return 'Punkte anzeigen';
      default:
        return 'Voir les Scores';
    }
  }

  String get resetGame {
    switch (locale.languageCode) {
      case 'en':
        return 'Reset game';
      case 'de':
        return 'Spiel zurücksetzen';
      default:
        return 'Réinitialiser le jeu';
    }
  }

  String get quit {
    switch (locale.languageCode) {
      case 'en':
        return 'Quit';
      case 'de':
        return 'Beenden';
      default:
        return 'Quitter';
    }
  }

  String get easyLevel {
    switch (locale.languageCode) {
      case 'en':
        return 'Easy level';
      case 'de':
        return 'Einfaches Niveau';
      default:
        return 'Niveau facile';
    }
  }

  String get mediumLevel {
    switch (locale.languageCode) {
      case 'en':
        return 'Medium level';
      case 'de':
        return 'Mittleres Niveau';
      default:
        return 'Niveau moyen';
    }
  }

  String get hardLevel {
    switch (locale.languageCode) {
      case 'en':
        return 'Hard level';
      case 'de':
        return 'Schwieriges Niveau';
      default:
        return 'Niveau difficile';
    }
  }

  String get homeTitle {
    switch (locale.languageCode) {
      case 'en':
        return 'Home';
      case 'de':
        return 'Startseite';
      default:
        return 'Accueil';
    }
  }

  String get chooseGame {
    switch (locale.languageCode) {
      case 'en':
        return 'Choose a game';
      case 'de':
        return 'Wähle ein Spiel';
      default:
        return 'Choisissez un jeu';
    }
  }

  String get seerGame {
    switch (locale.languageCode) {
      case 'en':
        return 'Seer game';
      case 'de':
        return 'Hellseher-Spiel';
      default:
        return 'Jeu clairvoyant';
    }
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any((l) => l.languageCode == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}


