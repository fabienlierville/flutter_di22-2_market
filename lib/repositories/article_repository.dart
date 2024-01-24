import 'package:market/models/article.dart';
import 'package:market/models/magasin.dart';
import 'package:market/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class ArticleRepository{
  static Future<List<Article>> getAll(Magasin magasin) async {
    Database bdd = await DataBaseService.database;
    List<Map<String, dynamic>> resultat = await bdd.query(
        'article', where: 'magasin = ?', whereArgs: [magasin.id]);

    List<Article> articles = [];
    resultat.forEach((map) {
      articles.add(Article.fromMap(map));
    });

    return articles;
  }

  static Future<Article> upsert(Article article) async{
    Database bdd = await DataBaseService.database;
    if (article.id == null) {
      article.id = await bdd.insert('article', article.toMap());
    }else{
      await bdd.update('article', article.toMap(), where: 'id = ?', whereArgs: [article.id]);
    }
    return article;
  }


}