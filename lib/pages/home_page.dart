import 'package:flutter/material.dart';
import 'package:market/models/magasin.dart';
import 'package:market/repositories/magasin_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magasins"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Ajout Magasin"),
          onPressed: () async{
            Magasin magasin = Magasin(nom: "Leclerc");
            magasin = await MagasinRepository.ajout(magasin);
            print(magasin.id);
          },
        ),
      ),
    );
  }
}
