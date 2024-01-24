

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
}