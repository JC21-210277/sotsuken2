import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sotsuken2/Data/AllUserData.dart';

class DBProvider {

  DBProvider._();

  static final DBProvider instance = DBProvider._();
  Database? _database;

  // Databaseが存在するかどうか確認して、あったら返す。
  Future<Database> get database async {
    debugPrint("データベースが存在しているか確認しにきました");
    if (_database != null) return _database!;
    // Databaseがない場合に作成する。
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    debugPrint("_initDatabaseにきました");
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'test10.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    debugPrint("_onCreateしにきました");

    await db.execute('PRAGMA foreign_keys = ON;');//外部キーON
    debugPrint("外部キー指定しました");

    //ユーザ表
    await db.execute('''
    CREATE TABLE user (
    userid INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT
    )
    ''');
    debugPrint("ユーザ表を作成しました");
    //カテゴリー表
    await db.execute('''
        CREATE TABLE category(
          categoryid TEXT PRIMARY KEY,
          categoryname TEXT
        )
    ''');debugPrint("カテゴリー表を作成しました");
    //美容表
    await db.execute('''
        CREATE TABLE beauty(
          beautyid TEXT PRIMARY KEY,
          beautyname TEXT,
          categoryid TEXT,
          FOREIGN KEY(categoryid) REFERENCES category(categoryid)
        )
    ''');debugPrint("美容表を作成しました");
    //個人追加表
    await db.execute('''
        CREATE TABLE k_add(
          addid INTEGER PRIMARY KEY AUTOINCREMENT,
          userid INTEGER,
          hiragana TEXT,
          kanji TEXT,
          eigo TEXT,
          categoryid TEXT,
          FOREIGN KEY(userid) REFERENCES user(userid),
          FOREIGN KEY(categoryid) REFERENCES category(categoryid)
        )
    ''');debugPrint("個人追加表を作成しました");
    //食品表
    await db.execute('''
        CREATE TABLE food(
          foodid TEXT PRIMARY KEY, 
          foodname TEXT,
          categoryid TEXT,
          FOREIGN KEY(categoryid) REFERENCES category(categoryid)
        )
    ''');debugPrint("食品表を作成しました");
    //リスト表
    await db.execute('''
        CREATE TABLE list(
          listid INTEGER PRIMARY KEY AUTOINCREMENT,
          userid INTEGER,
          foodid TEXT,
          beautyid INTEGER,
          addid INTEGER,
          FOREIGN KEY(userid) REFERENCES user(userid),
          FOREIGN KEY(foodid) REFERENCES food(foodid),
          FOREIGN KEY(beautyid) REFERENCES category(beautyid),
          FOREIGN KEY(addid) REFERENCES K_add(addid)
        )
    ''');debugPrint("リスト表を作成しました");


    //カテゴリー定義
    debugPrint("カテゴリー定義");
    final c1 = <String, dynamic>{ 'categoryid': 'HG','categoryname': '表示義務'};
    final c2 = <String, dynamic>{ 'categoryid': 'HS','categoryname': '表示推奨'};
    final c3 = <String, dynamic>{ 'categoryid': 'BH','categoryname': '非推奨'};
    final c4 = <String, dynamic>{ 'categoryid': 'TS','categoryname': '追加成分'};

    //カテゴリー挿入
    debugPrint("カテゴリー挿入");
    await db.insert("category", c1);
    await db.insert("category", c2);
    await db.insert("category", c3);
    await db.insert("category", c4);
    debugPrint("カテゴリー表にカテゴリーの中身をいれました");

    //食品の初期データ固定(定義)
    //表示義務
    debugPrint("表示義務");
    final values1 = <String, dynamic>{ 'foodid': 'GA1','foodname': 'えび','categoryid': 'HG'};
    final values2 = <String, dynamic>{ 'foodid': 'GA2','foodname': '海老','categoryid': 'HG'};
    final values3 = <String, dynamic>{ 'foodid': 'GA3','foodname': 'shrimp','categoryid': 'HG'};

    final values4 = <String, dynamic>{ 'foodid': 'GB1','foodname': 'くるみ','categoryid': 'HG'};
    final values5 = <String, dynamic>{ 'foodid': 'GB2','foodname': '胡桃','categoryid': 'HG'};
    final values6 = <String, dynamic>{ 'foodid': 'GB3','foodname': 'walnut','categoryid': 'HG'};

    final values7 = <String, dynamic>{ 'foodid': 'GC1','foodname': 'かに','categoryid': 'HG'};
    final values8 = <String, dynamic>{ 'foodid': 'GC2','foodname': '蟹','categoryid': 'HG'};
    final values9 = <String, dynamic>{ 'foodid': 'GC3','foodname': 'crab','categoryid': 'HG'};

    final values10 = <String, dynamic>{ 'foodid': 'GD1','foodname': 'こむぎ','categoryid': 'HG'};
    final values11 = <String, dynamic>{ 'foodid': 'GD2','foodname': '小麦','categoryid': 'HG'};
    final values12 = <String, dynamic>{ 'foodid': 'GD3','foodname': 'wheat','categoryid': 'HG'};

    final values13 = <String, dynamic>{ 'foodid': 'GE1','foodname': 'そば','categoryid': 'HG'};
    final values14 = <String, dynamic>{ 'foodid': 'GE2','foodname': '蕎麦','categoryid': 'HG'};
    final values15 = <String, dynamic>{ 'foodid': 'GE3','foodname': 'buckwheat','categoryid': 'HG'};

    final values16 = <String, dynamic>{ 'foodid': 'GF1','foodname': 'たまご','categoryid': 'HG'};
    final values17 = <String, dynamic>{ 'foodid': 'GF2','foodname': '卵','categoryid': 'HG'};
    final values18 = <String, dynamic>{ 'foodid': 'GF3','foodname': 'egg','categoryid': 'HG'};

    final values19 = <String, dynamic>{ 'foodid': 'GG1','foodname': '乳','categoryid': 'HG'};
    final values20 = <String, dynamic>{ 'foodid': 'GG2','foodname': 'dairy','categoryid': 'HG'};
    final values21 = <String, dynamic>{ 'foodid': 'GG3','foodname': '牛乳','categoryid': 'HG'};
    final values22 = <String, dynamic>{ 'foodid': 'GG4','foodname': 'milk','categoryid': 'HG'};

    final values23 = <String, dynamic>{ 'foodid': 'GH1','foodname': 'ピーナッツ','categoryid': 'HG'};
    final values24 = <String, dynamic>{ 'foodid': 'GH2','foodname': '落花生','categoryid': 'HG'};
    final values25 = <String, dynamic>{ 'foodid': 'GH3','foodname': 'peanut','categoryid': 'HG'};


    //表示推奨
    debugPrint("表示推奨");
    final values26 = <String, dynamic>{ 'foodid': 'SA1','foodname': 'アーモンド','categoryid': 'HS'};
    final values27 = <String, dynamic>{ 'foodid': 'SA2','foodname': '扁桃','categoryid': 'HS'};
    final values28 = <String, dynamic>{ 'foodid': 'SA3','foodname': 'almond','categoryid': 'HS'};

    final values29 = <String, dynamic>{ 'foodid': 'SB1','foodname': 'あわび','categoryid': 'HS'};
    final values30 = <String, dynamic>{ 'foodid': 'SB2','foodname': '鮑','categoryid': 'HS'};
    final values31 = <String, dynamic>{ 'foodid': 'SB3','foodname': 'abalone','categoryid': 'HS'};

    final values32 = <String, dynamic>{ 'foodid': 'SC1','foodname': 'いか','categoryid': 'HS'};
    final values33 = <String, dynamic>{ 'foodid': 'SC2','foodname': '烏賊','categoryid': 'HS'};
    final values34 = <String, dynamic>{ 'foodid': 'SC3','foodname': 'squid','categoryid': 'HS'};

    final values35 = <String, dynamic>{ 'foodid': 'SD1','foodname': 'いくら','categoryid': 'HS'};
    final values36 = <String, dynamic>{ 'foodid': 'SD2','foodname': '鮭卵','categoryid': 'HS'};
    final values37 = <String, dynamic>{ 'foodid': 'SD3','foodname': 'salmon roe','categoryid': 'HS'};

    final values38 = <String, dynamic>{ 'foodid': 'SE1','foodname': 'カシューナッツ','categoryid': 'HS'};
    final values39 = <String, dynamic>{ 'foodid': 'SE2','foodname': '加州','categoryid': 'HS'};
    final values40 = <String, dynamic>{ 'foodid': 'SE3','foodname': 'cashew nuts','categoryid': 'HS'};

    final values41 = <String, dynamic>{ 'foodid': 'SF1','foodname': 'オレンジ','categoryid': 'HS'};
    final values42 = <String, dynamic>{ 'foodid': 'SF2','foodname': '甘橙','categoryid': 'HS'};
    final values43 = <String, dynamic>{ 'foodid': 'SF3','foodname': 'orange','categoryid': 'HS'};

    final values44 = <String, dynamic>{ 'foodid': 'SG1','foodname': 'キウイ','categoryid': 'HS'};
    final values45 = <String, dynamic>{ 'foodid': 'SG2','foodname': 'キウイフルーツ','categoryid': 'HS'};
    final values46 = <String, dynamic>{ 'foodid': 'SG3','foodname': '彌猴桃','categoryid': 'HS'};
    final values47 = <String, dynamic>{ 'foodid': 'SG4','foodname': 'kiwi','categoryid': 'HS'};

    final values48 = <String, dynamic>{ 'foodid': 'SH1','foodname': 'ぎゅうにく','categoryid': 'HS'};
    final values49 = <String, dynamic>{ 'foodid': 'SH2','foodname': '牛肉','categoryid': 'HS'};
    final values50 = <String, dynamic>{ 'foodid': 'SH3','foodname': 'beef','categoryid': 'HS'};

    final values51 = <String, dynamic>{ 'foodid': 'SI1','foodname': 'ごま','categoryid': 'HS'};
    final values52 = <String, dynamic>{ 'foodid': 'SI2','foodname': '胡麻','categoryid': 'HS'};
    final values53 = <String, dynamic>{ 'foodid': 'SI3','foodname': 'sesame','categoryid': 'HS'};

    final values54 = <String, dynamic>{ 'foodid': 'SJ1','foodname': 'さけ','categoryid': 'HS'};
    final values55 = <String, dynamic>{ 'foodid': 'SJ2','foodname': '鮭','categoryid': 'HS'};
    final values56 = <String, dynamic>{ 'foodid': 'SJ3','foodname': 'salmon','categoryid': 'HS'};

    final values57 = <String, dynamic>{ 'foodid': 'SK1','foodname': 'さば','categoryid': 'HS'};
    final values58 = <String, dynamic>{ 'foodid': 'SK2','foodname': '鯖','categoryid': 'HS'};
    final values59 = <String, dynamic>{ 'foodid': 'SK3','foodname': 'mackerel','categoryid': 'HS'};

    final values60 = <String, dynamic>{ 'foodid': 'SL1','foodname': 'だいず','categoryid': 'HS'};
    final values61 = <String, dynamic>{ 'foodid': 'SL2','foodname': '大豆','categoryid': 'HS'};
    final values62 = <String, dynamic>{ 'foodid': 'SL3','foodname': 'soybean','categoryid': 'HS'};

    final values63 = <String, dynamic>{ 'foodid': 'SM1','foodname': 'とりにく','categoryid': 'HS'};
    final values64 = <String, dynamic>{ 'foodid': 'SM2','foodname': '鶏肉','categoryid': 'HS'};
    final values65 = <String, dynamic>{ 'foodid': 'SM3','foodname': 'chicken','categoryid': 'HS'};

    final values66 = <String, dynamic>{ 'foodid': 'SN1','foodname': 'バナナ','categoryid': 'HS'};
    final values67 = <String, dynamic>{ 'foodid': 'SN2','foodname': '甘蕉','categoryid': 'HS'};
    final values68 = <String, dynamic>{ 'foodid': 'SN3','foodname': 'banana','categoryid': 'HS'};

    final values69 = <String, dynamic>{ 'foodid': 'SO1','foodname': 'ぶたにく','categoryid': 'HS'};
    final values70 = <String, dynamic>{ 'foodid': 'SO2','foodname': '豚肉','categoryid': 'HS'};
    final values71 = <String, dynamic>{ 'foodid': 'SO3','foodname': 'pork','categoryid': 'HS'};

    final values72 = <String, dynamic>{ 'foodid': 'SP1','foodname': 'まつたけ','categoryid': 'HS'};
    final values73 = <String, dynamic>{ 'foodid': 'SP2','foodname': '松茸','categoryid': 'HS'};
    final values74 = <String, dynamic>{ 'foodid': 'SP3','foodname': 'matsutake mushroom','categoryid': 'HS'};

    final values75 = <String, dynamic>{ 'foodid': 'SQ1','foodname': 'もも','categoryid': 'HS'};
    final values76 = <String, dynamic>{ 'foodid': 'SQ2','foodname': '桃','categoryid': 'HS'};
    final values77 = <String, dynamic>{ 'foodid': 'SQ3','foodname': 'peach','categoryid': 'HS'};

    final values78 = <String, dynamic>{ 'foodid': 'SR1','foodname': 'やまいも','categoryid': 'HS'};
    final values79 = <String, dynamic>{ 'foodid': 'SR2','foodname': '山芋','categoryid': 'HS'};
    final values80 = <String, dynamic>{ 'foodid': 'SR3','foodname': 'yam','categoryid': 'HS'};

    final values81 = <String, dynamic>{ 'foodid': 'SS1','foodname': 'りんご','categoryid': 'HS'};
    final values82 = <String, dynamic>{ 'foodid': 'SS2','foodname': '林檎','categoryid': 'HS'};
    final values83 = <String, dynamic>{ 'foodid': 'SS3','foodname': 'apple','categoryid': 'HS'};

    final values84 = <String, dynamic>{ 'foodid': 'ST1','foodname': 'ゼラチン','categoryid': 'HS'};
    final values85 = <String, dynamic>{ 'foodid': 'ST2','foodname': '膠','categoryid': 'HS'};
    final values86 = <String, dynamic>{ 'foodid': 'ST3','foodname': 'gelatin','categoryid': 'HS'};


    //食品の初期データ固定(挿入)
    await db.insert("food", values1);
    await db.insert("food", values2);
    await db.insert("food", values3);
    await db.insert("food", values4);
    await db.insert("food", values5);
    await db.insert("food", values6);
    await db.insert("food", values7);
    await db.insert("food", values8);
    await db.insert("food", values9);
    await db.insert("food", values10);
    await db.insert("food", values11);
    await db.insert("food", values12);
    await db.insert("food", values13);
    await db.insert("food", values14);
    await db.insert("food", values15);
    await db.insert("food", values16);
    await db.insert("food", values17);
    await db.insert("food", values18);
    await db.insert("food", values19);
    await db.insert("food", values20);
    await db.insert("food", values21);
    await db.insert("food", values22);
    await db.insert("food", values23);
    await db.insert("food", values24);
    await db.insert("food", values25);
    debugPrint("表示義務をいれました");


    await db.insert("food", values26);
    await db.insert("food", values27);
    await db.insert("food", values28);
    await db.insert("food", values29);
    await db.insert("food", values30);
    await db.insert("food", values31);
    await db.insert("food", values32);
    await db.insert("food", values33);
    await db.insert("food", values34);
    await db.insert("food", values35);
    await db.insert("food", values36);
    await db.insert("food", values37);
    await db.insert("food", values38);
    await db.insert("food", values39);
    await db.insert("food", values40);
    await db.insert("food", values41);
    await db.insert("food", values42);
    await db.insert("food", values43);
    await db.insert("food", values44);
    await db.insert("food", values45);
    await db.insert("food", values46);
    await db.insert("food", values47);
    await db.insert("food", values48);
    await db.insert("food", values49);
    await db.insert("food", values50);
    await db.insert("food", values51);
    await db.insert("food", values52);
    await db.insert("food", values53);
    await db.insert("food", values54);
    await db.insert("food", values55);
    await db.insert("food", values56);
    await db.insert("food", values57);
    await db.insert("food", values58);
    await db.insert("food", values59);
    await db.insert("food", values60);
    await db.insert("food", values61);
    await db.insert("food", values62);
    await db.insert("food", values63);
    await db.insert("food", values64);
    await db.insert("food", values65);
    await db.insert("food", values66);
    await db.insert("food", values67);
    await db.insert("food", values68);
    await db.insert("food", values69);
    await db.insert("food", values70);
    await db.insert("food", values71);
    await db.insert("food", values72);
    await db.insert("food", values73);
    await db.insert("food", values74);
    await db.insert("food", values75);
    await db.insert("food", values76);
    await db.insert("food", values77);
    await db.insert("food", values78);
    await db.insert("food", values79);
    await db.insert("food", values80);
    await db.insert("food", values81);
    await db.insert("food", values82);
    await db.insert("food", values83);
    await db.insert("food", values84);
    await db.insert("food", values85);
    await db.insert("food", values86);
    debugPrint("表示推奨をいれました");
  }


  //ユーザの追加処理
  Future<int> insertUser(AllUserData row) async {
    debugPrint("insertUserにきました");
    Database db = await instance.database;
    return await db.insert('user', row.toMap());
  }

}
