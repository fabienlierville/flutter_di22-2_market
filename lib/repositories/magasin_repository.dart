

import 'package:market/models/magasin.dart';
import 'package:market/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class MagasinRepository{
   /* ADD MAGASIN */
  static Future<Magasin> ajout(Magasin magasin) async{
    // Récupérer la connexion BDD
    Database bdd = await DataBaseService.database;
    // Faire la requete SQL
    magasin.id = await bdd.insert("magasin", magasin.toMap());
    //REtourner le magasin ajouté (pour avoir l'ID)
    return magasin;
  }

  /* GET ALL */
  static Future<List<Magasin>> getAll() async{
    // Récupérer la connexion BDD
    Database bdd = await DataBaseService.database;
    List<Map<String,dynamic>> result = await bdd.query("magasin");
    // Parcourir la map pour retourner une liste d'objet
    List<Magasin> l = [];
    result.forEach((Map<String,dynamic> ligne) {
      l.add(Magasin.fromMap(ligne));
    });
    return l;
  }
}