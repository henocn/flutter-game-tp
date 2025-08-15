import 'dart:math';
import 'package:flutter/material.dart';

class JeuFacilePage extends StatefulWidget {
  const JeuFacilePage({super.key});
  @override
  State<JeuFacilePage> createState() => _JeuFacilePageState();
}

class _JeuFacilePageState extends State<JeuFacilePage> {
  final TextEditingController _controller = TextEditingController();
  late int _nombreMystere;
  int _tentativesRestantes = 3;
  String _message = "";
  @override
  void initState() {
    super.initState();
    _genererNombre();
  }

  void _genererNombre() {
    _nombreMystere = Random().nextInt(10) + 1; // 1 à 10
    _tentativesRestantes = 3;
    _message = "";
    _controller.clear();
  }

  void _verifierNombre() {
    if (_controller.text.isEmpty) return;
    int proposition = int.tryParse(_controller.text) ?? 0;
    setState(() {
      if (proposition == _nombreMystere) {
        _message = "Bravo ! Vous avez trouvé 🎉";
        _afficherDialogueFin(true);
      } else {
        _tentativesRestantes--;
        if (_tentativesRestantes > 0) {
          _message =
              proposition < _nombreMystere ? "Trop petit !" : "Trop grand !";
        } else {
          _message = "Perdu ! Le nombre était $_nombreMystere.";
          _afficherDialogueFin(false);
        }
      }
    });
    _controller.clear();
  }

  void _afficherDialogueFin(bool victoire) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text(victoire ? "Victoire 🎉" : "Défaite ❌"),
            content: Text(
              victoire
                  ? "Félicitations, vous avez trouvé le nombre mystère."
                  : "Dommage ! Le nombre était $_nombreMystere.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // fermer le dialogue
                  _genererNombre(); // recommencer
                  setState(() {});
                },
                child: Text("Continuer"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // fermer le dialogue
                  Navigator.pop(context); // quitter le jeu
                },
                child: Text("Quitter"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Niveau facile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Devinez un nombre entre 1 et 10"),
            SizedBox(height: 10),
            Text("Tentatives restantes : $_tentativesRestantes"),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Entrez votre nombre"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _verifierNombre, child: Text("Vérifier")),
            SizedBox(height: 20),
            Text(_message, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
