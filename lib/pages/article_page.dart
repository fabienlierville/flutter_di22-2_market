import 'dart:io';

import 'package:flutter/material.dart';
import 'package:market/models/article.dart';
import 'package:market/models/magasin.dart';
import 'package:market/pages/article_add_page.dart';
import 'package:market/repositories/article_repository.dart';

class ArticlePage extends StatefulWidget {
  final Magasin magasin;
  const ArticlePage({super.key, required this.magasin});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List<Article>? articles;

  @override
  void initState() {
    recuperer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.magasin.nom),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context){
                    return ArticleAddPage(magasin: widget.magasin);
                  })
                );
              },
              child: Text("Ajouter")
          )
        ],
      ),
      body: (articles == null || articles?.length == 0)
          ? Text("Aucune données")
          : GridView.builder(
              itemCount: articles?.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, i) {
                Article article = articles![i];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(article.nom),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        child:(article.image == null || article.image.length == 0)
                            ? Image.asset("assets/images/no_image.png")
                            : Image.file(File(article.image)),
                      ),

                      Text((article.prix == null)
                          ? "Aucun prix renseigné"
                          : "Prix: ${article.prix}€"),
                    ],
                  ),
                );
              }),
    );
  }

  void recuperer() async {
    List<Article> articleList = await ArticleRepository.getAll(widget.magasin);
    setState(() {
      articles = articleList;
    });
  }
}
