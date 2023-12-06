import 'package:flutter/material.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';
import 'package:sotsuken2/Data/AllUserData.dart';

class StateCreateUserCheck extends StatefulWidget{
  const StateCreateUserCheck({super.key});

  @override
  State<StateCreateUserCheck> createState(){
    return CreateUserCheck();
  }
}

class CreateUserCheck extends State<StateCreateUserCheck>{
  static String HObligation = "";
  static String HRecommendation = "";


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text('成分チェッカー'),
      ),
      body:  Center(
        child:SingleChildScrollView(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //表示義務
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 120, 0),
                    decoration:BoxDecoration(
                        border:Border.all(color:Colors.red,width:1)
                    ),
                    child: Container(
                      margin:const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      padding:const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.red,width:1)
                      ),
                      child:const Text('表示義務',
                          style:TextStyle(
                              fontSize:30,
                              fontWeight: FontWeight.bold,
                              color:Colors.deepOrange
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 30),
                    padding:const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    decoration:BoxDecoration(
                        border:Border.all(color:Colors.red,width:1)
                    ),
                    //テキスト表示させるやつがいる↓
                    child:Text(HObligation,
                      style:const TextStyle(
                        fontSize:30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //表示推奨
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
                    decoration:BoxDecoration(
                        border:Border.all(color:Colors.blue,width:1)
                    ),
                    child:Container(
                      margin:const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      padding:const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration:BoxDecoration(
                          border:Border.all(color:Colors.blue,width:1)
                      ),
                      child:Text('表示推奨',style:TextStyle(fontSize:30,fontWeight: FontWeight.bold,color:Colors.indigo)),
                    ),
                  ),
                  Container(
                    width: 280,
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 30),
                    padding:const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    decoration:BoxDecoration(
                        border:Border.all(color:Colors.blue,width:1)
                    ),
                    //テキスト表示させるやつがいる↓
                    child:Text(HRecommendation,
                      style:const TextStyle(
                        fontSize:30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      width:230,
                      height:60,
                      margin:const EdgeInsets.fromLTRB(15, 0, 15, 40),
                      child:ElevatedButton(
                          child:const Text('登録',style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
                          onPressed:(){
                            AllUserData aud = AllUserData();
                            AllObligationData aod = AllObligationData();
                            AllRecommendationData ard = AllRecommendationData();
                            setState(() {
                              aud.setUserNameFinal();
                              aod.AllResetObligation();
                              ard.AllResetRecommendation();
                            });
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.of(context).pop();
                          }
                      )
                  )
                ]
            )
        ),

      ),
    );
  }
}