import 'package:flutter/material.dart';

import '../DB/Database.dart';
import 'AllUserData.dart';

class AllAnotherData{

  static List<bool> boolList3 = []; //true,false全部分
  static List<String> valueList3= []; //名前全部
  static List<String> valueCheck3 = []; //trueのなまえ


  void addMethod3(String nam) {
    boolList3.add(false);
    debugPrint(valueList3.toString());
  }

  void setValueList3(){
    valueList3 = DBProvider.AddList;
    debugPrint('valueList3のなかみみ$valueList3');
  }

  List<String> getValue3() {
    return valueList3;
  }

  List<bool> getBool3() {
    return boolList3;
  }

  void HanteiAnother(){
    valueCheck3.clear();

    for(int x = 0;x < boolList3.length; x++){
      if(boolList3[x] == true){
        valueCheck3.add(DBProvider.AddList[x]);

      }
    }
    debugPrint(valueCheck3.toString());
  }

  List<String> getValueCheck3(){
    return valueCheck3;
  }

  void setValueCheck3(List<String> dbValue){
    valueCheck3 =  dbValue;
  }

  void AllResetAnother(){
    debugPrint(getValue3().length.toString());
    if(DBProvider.AddList.isNotEmpty){
      boolList3.clear();
      for(int n = 1 ; n <= DBProvider.AddList.length ; n++ ){
        boolList3.add(false);
      }
    }
    valueCheck3 = [];
    debugPrint(boolList3.toString());
  }

  void valueChangeBool3(){
    int count = 0;
    for(String value in DBProvider.userAddList){
      debugPrint('valueChangeBool3とおった$valueList3');
      while(true){
        if(valueList3[count] == value){
          boolList3[count] = true;
          count++;
          break;
        }else{
          boolList3[count] = false;
        }
        count++;
      }
    }
  }

  //追加した処理12/21
  //追加成分のinsert処理
  void insertAllResetAnother() async {
    debugPrint('insertAllResetAnotherに来ました');
    final dbProvider = DBProvider.instance;

    final int userid = await dbProvider.selectUserId(AllUserData.sUserName);// ユーザーIDを非同期で取得
    debugPrint('参照したいuseridは:$userid');


    //あるユーザが登録したaddidを取得
    for(int x = 0; x < valueCheck3.length; x++) {
      final int addid = await dbProvider.selectAddId(valueCheck3[x]);//checkaddに格納されている追加名を1つずつ引数で渡す
      debugPrint('参照したいaddidは:$addid');
      final result2 = await dbProvider.insertlistAdd(userid, DBProvider.addid);// リスト表へのinsert処理
      debugPrint('リスト表にinsert処理した内容:$result2');
    }
    debugPrint(valueCheck3.toString());
  }

/*
  String getValueString3() {
    debugPrint(valueList3.length.toString());
    return valueList3.toString();
  }
   */
}

