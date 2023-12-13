import 'package:flutter/material.dart';
//臨時
import 'AllergyNotDetection.dart';

class StateAllergyDetection extends StatefulWidget{
  const StateAllergyDetection({super.key});

  @override
  State<StateAllergyDetection> createState(){
    return AllergyDetection_Page();
  }
}

class AllergyDetection_Page extends State<StateAllergyDetection>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('成分チェッカー')
      ),
      body: Center(
          child:SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                  decoration: BoxDecoration(
                      border: Border.all(color:Colors.deepOrange)
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
                    color: Colors.deepOrange,
                    child: const FittedBox(
                      child:Text('検出されたアレルゲン',
                        style: TextStyle(
                            fontSize: 24,
                            color:Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color:Colors.deepOrange,width: 1)
                    ),
                    child:Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.deepOrange,width: 1)
                      ),
                      margin: const EdgeInsets.all(5),
                      width: 300,
                      height: 320,
                      //多分↓ここのconst邪魔になる
                      child:const Column(
                        children: [
                          Text(''),
                          Text(''),
                          Text(''),
                          Text(''),
                          Text(''),
                          Text(''),
                        ],
                      ),
                    )
                ),

                Container(
                  height: 60,
                  width: 300,
                  margin: const EdgeInsets.all(10),
                  child:OutlinedButton(
                    style:OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const StateAllergyNotDetection();
                          })
                      );
                    },
                    child: const FittedBox(
                      child: Text('他の商品をスキャンする',
                        style:TextStyle(
                          fontSize: 24,
                          color:Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0,0,5,10),
                        height: 80,
                        width: 160,
                        child:OutlinedButton(
                          style:OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          onPressed: (){
                            Navigator.popUntil(context,ModalRoute.withName('ChooseUser_page'));
                          },
                          child: const FittedBox(
                            child:Text('他のユーザー\nを選択する',
                                style:TextStyle(
                                  fontSize: 21,
                                  color:Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign:TextAlign.center
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5,0,0,10),
                        height: 80,
                        width: 150,
                        child:OutlinedButton(
                            style:OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            child: const FittedBox(
                              child:Text('読み取った\n成分を見る',
                                  style:TextStyle(
                                    fontSize: 21,
                                    color:Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign:TextAlign.center
                              ),
                            ),
                            onPressed: (){}
                        ),
                      )
                    ]
                )
              ],
            ),
          )
      ),
    );
  }
}