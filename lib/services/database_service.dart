
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService{
  static Database? _databse;

  //Récupérer la connexion ou créer la connexion (principe du SingleTon)
  static Future<Database> get database async{
    print("_databse = ${_databse}");
    if(_databse == null){
      _databse = await _opendb();
    }
    return _databse!;
  }

  static Future<Database> _opendb() async{
    //Récupérer le chemin "Document" de l'app
    Directory directory = await getApplicationDocumentsDirectory();
    String databaseFullPath = "${directory.path}/database.db";
    //print("databaseFullPath = ${databaseFullPath}");
    Database bdd = await openDatabase(databaseFullPath, version: 2,onCreate: _onCreate, onConfigure: _onConfigure, onUpgrade: _onUpgrade);

    return bdd;
  }

  static Future<void> _onUpgrade(Database db, int versionOnPhone, int versionTarget) async{
    if(versionOnPhone == 1 && versionTarget == 2){
      await db.execute('''
      CREATE TABLE article(
        id INTEGER PRIMARY KEY,
        nom VARCHAR(50) NOT NULL,
        magasin INTEGER,
        prix float,
        image TEXT,
        FOREIGN KEY (magasin) REFERENCES magasin (id) ON DELETE CASCADE
      )
    ''');
    }
  }

  static Future<void> _onConfigure(Database db) async{
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future<void> _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE magasin(
        id INTEGER PRIMARY KEY,
        nom VARCHAR(50) NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE article(
        id INTEGER PRIMARY KEY,
        nom VARCHAR(50) NOT NULL,
        magasin INTEGER,
        prix float,
        image TEXT,
        FOREIGN KEY (magasin) REFERENCES magasin (id) ON DELETE CASCADE
      )
    ''');
  }

}