import 'package:flutter/material.dart';
import 'AddAnotherIngredient.dart';

import 'package:sotsuken2/Data/AllAnotherData.dart';

//臨時
import 'AllergyDetection.dart';




class StateAnother_ingredient extends StatefulWidget{
  final int PageFlag;
  const StateAnother_ingredient({Key?key, required this.PageFlag}): super(key:key) ;

  @override
  State<StateAnother_ingredient> createState(){
    return Another_ingredient();
  }
}


class Another_ingredient extends State<StateAnother_ingredient>{
  AllAnotherData aad = AllAnotherData();

  int forMethod(){
    int forCount;
    if(aad.getValue3().length % 2 == 1){
      forCount = aad.getValue3().length+1;
    }else{
      forCount = aad.getValue3().length;
    }
    return forCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: const Text('成分チェッカー'),
        ),
        body: Center(
            child:SingleChildScrollView(
                child:Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        decoration:BoxDecoration(
                          border: Border.all(
                            color:Colors.indigo,
                            width: 1,
                          ),
                        ),
                        child: const Text('その他の登録した成分',
                            style: TextStyle(
                                fontSize: 24,
                                color:Colors.indigo,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                      if(aad.getValue3().isEmpty)...[
                        Container(
                          margin: const EdgeInsets.all(30),
                          child:const Text('何も登録されていません',style: TextStyle(fontSize: 25),),
                        ),
                      ],
                      for(int n = 0 ; n < forMethod(); n = n+2)...[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for(int nn = 0 ; nn < 2  ; nn++)...[
                                if(nn == 0)...[
                                  Container(
                                    width: 170,
                                    child:Transform.scale(
                                      scale:1.1,
                                      child: CheckboxListTile(
                                          controlAffinity: ListTileControlAffinity.leading,
                                          title: Transform.translate(
                                            offset: const Offset(-15,0),
                                            child:Text(aad.getValue3()[n+nn],style: TextStyle(fontSize: 20)),
                                          ),
                                          value: aad.getBool3()[n+nn],
                                          onChanged: (value) {
                                            setState(() {
                                              aad.getBool3()[n+nn] = value!;
                                            });
                                          }
                                      ),
                                    ),
                                  ),
                                ]else...[
                                  if(aad.getValue3().length % 2 == 1 && aad.getValue3().length == n+1)...[
                                    Container(
                                      width: 170,
                                    ),
                                  ]else...[
                                    Container(
                                      width: 170,
                                      child:Transform.scale(
                                        scale:1.1,
                                        child: CheckboxListTile(
                                            controlAffinity: ListTileControlAffinity.leading,
                                            title: Transform.translate(
                                              offset: const Offset(-15,0),
                                              child:Text(aad.getValue3()[n+nn],style: TextStyle(fontSize: 20)),
                                            ),
                                            value: aad.getBool3()[n+nn],
                                            onChanged: (value) {
                                              setState(() {
                                                aad.getBool3()[n+nn] = value!;
                                              });
                                            }
                                        ),
                                      ),
                                    ),
                                  ]

                                ]
                              ],
                            ]
                        )
                      ],
                      Container(
                        width: 290,
                        height: 90,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child:  OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.indigo,
                              side: const BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              )
                          ),
                          onPressed:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return const StateAddAnotherIngredient();
                                })
                            ).then((value){
                              setState(() {});
                            });
                          },
                          child: const Text('その他の追加成分を\n新規登録',style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                        width: 290,
                        height: 70,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                        child:  OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.deepOrange, side: const BorderSide(
                            color: Colors.deepOrange,
                            width: 1.5,
                          )
                          ),
                          onPressed:(){
                            if(widget.PageFlag == 0){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context){
                                    return const StateAllergyDetection();
                                  })
                              );

                            }else if(widget.PageFlag == 1){
                              Navigator.of(context).pop();
                            }
                            debugPrint(widget.PageFlag.toString());
                            //aod.HanteiObligation();
                          },
                          child: const Text('決定',style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                              textAlign: TextAlign.center),
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
}