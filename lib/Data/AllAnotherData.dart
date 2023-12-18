import 'package:flutter/material.dart';

class AllAnotherData{
  static List<String> valueList3= [];
  static List<bool> boolList3 = [];


  void addMethod3(String nam) {
    valueList3.add(nam);
    boolList3.add(false);
    debugPrint(valueList3.toString());
  }

  String getValueString3() {
    debugPrint(valueList3.length.toString());
    return valueList3.toString();
  }

  List<String> getValue3() {
    return valueList3;
  }

  List<bool> getBool3() {
    return boolList3;
  }


/*
  void deleteMethod(String nam){
    nameList.remove(nam);
  }

   */

}

