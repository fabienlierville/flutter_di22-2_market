import 'package:market/models/article.dart';
import 'package:market/models/magasin.dart';
import 'package:market/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class ArticleRepository{
  static Future<List<Article>> getAll(Magasin magasin) async {
    Database bdd = await DataBaseService.database;
    // Faire la requete SQL

    List<Map<String, dynamic>> resultat = await bdd.query(
        'article', where: 'magasin = ?', whereArgs: [magasin.id]);

    List<Article> articles = [];
    resultat.forEach((map) {
      articles.add(Article.fromMap(map));
    });

    return articles;
  }

}