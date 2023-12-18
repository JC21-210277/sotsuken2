import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/Obligation_allergy.dart';


class AllRecommendationData{

  static List<bool> boolList2 = List.filled(20, false);
  static List<String> valueList2 = ["あわび","いか","オレンジ","いくら","牛肉","ごま","さけ", "さば","大豆","鶏肉",
    "バナナ","豚肉","まつたけ","もも","やまいも","りんご","ゼラチン","アーモンド","カシューナッツ","キウイフルーツ"];
  static List<String> valueCheck2 = [];
  static String hRecommendation = "";


  //追加
  String getValueString(){
    debugPrint(valueList2.length.toString());
    return valueList2.toString();
  }

  List<String> getValue(){
    return valueList2;
  }

  List<bool> getBool(){
    return boolList2;
  }



  void setRecommendationBool(List<bool> box){
    boolList2.clear();
    boolList2.addAll(box);
  }

  void HanteiRecommendation(){
    valueCheck2.clear();
    for(int x = 0;x < boolList2.length; x++){
      if(boolList2[x] == true){
        valueCheck2.add(valueList2[x]);
      }
    }
    debugPrint(valueCheck2.toString());
  }

  String getCheckValue2(){
    hRecommendation = "";
    for(int x = 0;x < valueCheck2.length; x++){
      if(x == 0 || x == valueCheck2.length){
        hRecommendation = '$hRecommendation${valueCheck2[x]}';
      }else{
        hRecommendation = '$hRecommendation\n${valueCheck2[x]}';
      }
    }
    debugPrint(hRecommendation);
    return hRecommendation;
  }

  void AllResetRecommendation(){
    boolList2 =  List.filled(20, false);
    valueCheck2 = [];
    hRecommendation = "";
  }
}