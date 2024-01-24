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
            /*
            Magasin magasin = Magasin(nom: "Leclerc");
            magasin = await MagasinRepository.ajout(magasin);
            print(magasin.id);

             */

            List<Magasin> magasins = await MagasinRepository.getAll();
            magasins.forEach((element) {
              print("ID = ${element.id} | NOM = ${element.nom}");
            });

        Magasin? magasin = await MagasinRepository.getById(1);
        int result = await MagasinRepository.delete(magasin!);
        print(result);

          magasins = await MagasinRepository.getAll();
          magasins.forEach((element) {
          print("ID = ${element.id} | NOM = ${element.nom}");
          });
            /*
            Magasin? magasin = await MagasinRepository.getById(1);
            if(magasin != null){
              print("ID = ${magasin.id} | NOM = ${magasin.nom}");
            }
            magasin!.nom = "Leclerc ROUEN";

            await MagasinRepository.update(magasin);
            Magasin? magasin2 = await MagasinRepository.getById(1);
            print("ID = ${magasin2!.id} | NOM = ${magasin2!.nom}");
             */
          },


        ),
      ),
    );
  }
}
