import 'package:flutter/material.dart';
import 'CreateUser2.dart';

import 'package:sotsuken2/Data/AllUserData.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';

class StateCreateUser1 extends StatefulWidget{
  const StateCreateUser1({super.key});

  @override
  State<StateCreateUser1> createState(){
    return CreateUser1_Page();
  }
}

class CreateUser1_Page extends State<StateCreateUser1>{
  String UN = "";
  String ErrorMessage = "";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('成分チェッカー'),
      ),
      body: Center(
          child:SingleChildScrollView(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    margin:const EdgeInsets.fromLTRB(0, 10, 0, 30),
                    padding:const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.indigo,
                        width: 1,
                      ),
                    ),
                    child:const Text('ユーザー登録',
                      style: TextStyle(
                          fontSize: 30,
                          color:Colors.indigo,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.all(20),
                    child:const Text('ユーザー名を\n入力してください',
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.all(20),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo)
                    ),
                    child:SizedBox(
                      width:200,
                      child:TextField (
                        style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        maxLength: 7,
                        onChanged: (value){
                          UN = value;
                        },
                      ),
                    ),
                  ),
                  Text(ErrorMessage,style:const TextStyle(fontSize: 20,color:Colors.red)),
                  Container(
                      width: 200,
                      height:60,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        child:const Text('次へ',style: TextStyle(fontSize: 30),),
                        onPressed: (){
                          setState(() {
                            AllUserData aud = AllUserData(username: AllUserData.sUserName);
                            aud.setUserName(UN);
                            UserName = aud.getUserName();

                            AllObligationData aod = AllObligationData();
                            AllRecommendationData ard = AllRecommendationData();
                            aod.AllResetObligation();
                            ard.AllResetRecommendation();
                          });
                          if(UN == ""){
                            /*
                            setState(() {
                              ErrorMessage = "名前が入力されていません";
                            });
                            */
                          }else{
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return const StateCreateUser2();
                                })
                            );
                          }
                        },
                      )
                  ),
                ]
            ),
          )

      ),
    );
  }

}