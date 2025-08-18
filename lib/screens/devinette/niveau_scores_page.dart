import 'package:flutter/material.dart';
import '../../db/db_helper.dart';

class ScoresPage extends StatefulWidget {
  const ScoresPage({super.key});
  @override
  State<ScoresPage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {
  List<Map<String, dynamic>> _scores = [];
  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  void _loadScores() async {
    final data = await DBHelper.instance.getScores();
    setState(() {
      _scores = data;
    });
  }

  void _clearAllScores() async {
    await DBHelper.instance.clearScores();
    _loadScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scores enregistrés"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearAllScores,
          ),
        ],
      ),
      body:
          _scores.isEmpty
              ? const Center(child: Text("Aucun score enregistré"))
              : ListView.builder(
                itemCount: _scores.length,
                itemBuilder: (context, index) {
                  final score = _scores[index];
                  return ListTile(
                    title: Text("Score : ${score['score']}"),
                    subtitle: Text("Date : ${score['date']}"),
                  );
                },
              ),
    );
  }
}
