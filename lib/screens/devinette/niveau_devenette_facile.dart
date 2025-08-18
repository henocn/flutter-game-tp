import 'dart:math';
import 'package:flutter/material.dart';
import '../../db/db_helper.dart';
import './niveau_scores_page.dart';

class NiveauFacile extends StatefulWidget {
  const NiveauFacile({super.key});
  @override
  State<NiveauFacile> createState() => _NiveauFacileState();
}

class _NiveauFacileState extends State<NiveauFacile> {
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
    _nombreMystere = Random().nextInt(10) + 1; // Nombre entre 1 et 10
    _tentativesRestantes = 3;
    _message = "";
    _controller.clear();
    setState(() {});
  }

  void _verifierNombre() async {
    if (_controller.text.isEmpty) return;
    int proposition = int.tryParse(_controller.text) ?? 0;
    if (proposition == _nombreMystere) {
      _message = "Bravo ! Vous avez trouvé 🎉";
      await DBHelper.instance.insertScore(
          3 - _tentativesRestantes + 1); // score = tentatives utilisées
      _afficherDialogue(true);
    } else {
      _tentativesRestantes--;
      if (_tentativesRestantes > 0) {
        _message =
            proposition < _nombreMystere ? "Trop petit !" : "Trop grand !";
      } else {
        _message = "Perdu . Le nombre était $_nombreMystere 😢";
        await DBHelper.instance.insertScore(0); // 0 = perdu
        _afficherDialogue(false);
      }
    }
    _controller.clear();
    setState(() {});
  }

  void _afficherDialogue(bool victoire) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(victoire ? "Victoire 🎉" : "Défaite 😢"),
        content: Text(victoire
            ? "Félicitations, vous avez gagné !"
            : "Dommage ! Le nombre mystère était $_nombreMystere."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _genererNombre();
            },
            child: const Text("Continuer"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Quitter"),
          ),
        ],
      ),
    );
  }

  void _voirScores() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ScoresPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Niveau Facile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: "Voir les scores",
            onPressed: _voirScores,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Réinitialiser",
            onPressed: _genererNombre,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Devinez le nombre mystère entre 1 et 10",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Tentatives restantes : $_tentativesRestantes",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Votre proposition",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _verifierNombre,
              child: const Text("Vérifier"),
            ),
            const SizedBox(height: 10),
            Text(
              _message,
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
