
class Article{
  int id;
  String nom;
  double prix;
  String Image;
  int magasin; // clef étrangère

  Article({
    required this.id,
    required this.nom,
    required this.prix,
    required this.Image,
    required this.magasin,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nom': this.nom,
      'prix': this.prix,
      'Image': this.Image,
      'magasin': this.magasin,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as int,
      nom: map['nom'] as String,
      prix: map['prix'] as double,
      Image: map['Image'] as String,
      magasin: map['magasin'] as int,
    );
  }
}