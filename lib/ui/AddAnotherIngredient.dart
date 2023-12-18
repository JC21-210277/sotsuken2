import 'package:flutter/material.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';

class StateAddAnotherIngredient extends StatefulWidget{
  const StateAddAnotherIngredient({super.key});

  @override
  State<StateAddAnotherIngredient> createState(){
    return AddAnotherIngredient();
  }
}

class AddAnotherIngredient extends State<StateAddAnotherIngredient>{
  String ingredientName = "";
  String kanji = "";
  String english = "";
  String otherName = "";

  AllAnotherData aad = AllAnotherData();


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
                    margin:const EdgeInsets.fromLTRB(0, 30, 0, 15),
                    padding:const EdgeInsets.fromLTRB(40, 7, 40, 7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.indigo,
                        width: 1,
                      ),
                    ),
                    child:const Text('その他の成分を\n新規追加',
                      style: TextStyle(
                          fontSize: 25,
                          color:Colors.indigo,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.all(3),
                    child:const Text('下記情報を入力してください。',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child:const Text('※成分名(ひらがな)必須',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:EdgeInsets.fromLTRB(7, 3, 7, 3),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            border: Border.all(
                              color: Colors.indigo,
                              width: 1.5,
                            ),
                          ),
                          child: const Text('成分名\n(ひらがな)',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            border: Border.all(
                              color: Colors.indigo,
                              width: 1.5,
                            ),
                          ),
                          margin: EdgeInsets.all(10),
                          width: 190,
                          child: TextField(
                            style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                            onChanged: (value){
                              ingredientName = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin:const EdgeInsets.all(5),
                    child:const Text('成分名の漢字、英語、別名を\n入力してください。',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:90,
                        padding:EdgeInsets.fromLTRB(7, 3, 7, 3),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        child: const Text('漢字\n(任意)',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        width: 190,
                        child: TextField(
                          style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                          onChanged: (value){
                            kanji = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:90,
                        padding:EdgeInsets.fromLTRB(7, 3, 7, 3),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        child: const Text('英語\n(任意)',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        width: 190,
                        child: TextField(
                          style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                          onChanged: (value){
                            english = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:90,
                        padding:EdgeInsets.fromLTRB(7, 3, 7, 3),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        child: const Text('別名\n(任意)',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        margin: EdgeInsets.all(10),
                        width: 190,
                        child: TextField(
                          style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                          onChanged: (value){
                            otherName = value;
                          },
                        ),
                      ),
                    ],
                  ),


                  Container(
                      width: 200,
                      height:60,
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        child:const Text('登録',style: TextStyle(fontSize: 30),),
                        onPressed: (){
                          aad.addMethod3(kanji);
                          Navigator.pop(context);
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