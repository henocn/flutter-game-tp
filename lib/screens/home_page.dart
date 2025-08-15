import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choisir le jeu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Jeu devinette"),
              onPressed: () {
                //page qui mène la logique du jeu de devinette
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text("Jeu clairvoyant"),
              onPressed: () {
                //page qui mène la logique du jeu de devinette
              },
            ),
          ],
        ),
      ),
    );
  }
}
