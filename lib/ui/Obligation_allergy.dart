import 'package:flutter/material.dart';
import 'Recommendation_allergy.dart';
import 'Another_ingredient.dart';

import 'package:sotsuken2/Data/AllObligationData.dart';

//臨時
import 'AllergyDetection.dart';


class StateObligation_allergy extends StatefulWidget{
  final int PageFlag;
  const StateObligation_allergy({Key?key, required this.PageFlag}): super(key:key) ;

  @override
  State<StateObligation_allergy> createState(){
    return Obligation_allergy();
  }
}

class Obligation_allergy extends State<StateObligation_allergy>{
//チェックボックスの数だけいる(8)

  AllObligationData aod = AllObligationData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('成分チェッカー'),
        ),
        body: Center(
            child:SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children:<Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    decoration:BoxDecoration(
                      border: Border.all(
                        color:Colors.deepOrange,
                        width: 1,
                      ),
                    ),
                    child: const Text('表示義務アレルギー',
                        style: TextStyle(
                            fontSize: 25,
                            color:Colors.deepOrange,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                  for(int n = 0 ; n < 8; n = n+2)...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int nn = 0 ; nn < 2  ; nn++)...[
                          if(nn == 0)...[
                            Container(
                                width:160,
                                child:Transform.scale(
                                    scale:1.2,
                                    child:CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        title: Transform.translate(
                                          offset: const Offset(-15,0),
                                          child:Text(aod.getValue()[n+nn],style: TextStyle(fontSize: 20)),
                                        ),
                                        value: aod.getBool()[n+nn],
                                        onChanged: (value) {
                                          setState(() {
                                            aod.getBool()[n+nn] = value!;
                                          });
                                        }
                                    )
                                )
                            ),
                          ]else...[
                            Container(
                              width: 160,
                              child:Transform.scale(
                                scale:1.2,
                                child: CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.leading,
                                    title: Transform.translate(
                                      offset: const Offset(-15,0),
                                      child:Text(aod.getValue()[n+nn],style: TextStyle(fontSize: 20)),
                                    ),
                                    value: aod.getBool()[n+nn],
                                    onChanged: (value) {
                                      setState(() {
                                        aod.getBool()[n+nn] = value!;
                                      });
                                    }
                                ),
                              ),
                            ),
                          ]
                        ],
                      ],
                    ),
                  ],
                  Container(
                    height: 90,
                    width: 290,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                    child:OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.indigo, side: const BorderSide(
                        color: Colors.indigoAccent,
                        width: 1.5,
                      )
                      ),
                      onPressed:(){
                        aod.HanteiObligation();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return StateRecommendation_allergy(PageFlag: widget.PageFlag);
                            })
                        );
                      },
                      child: const FittedBox(
                        child: Text('表示推奨アレルギーを\n選択する',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center
                        ),
                      ),

                    ),
                  ),
                  if(widget.PageFlag == 0)...[
                    Container(
                      width: 290,
                      height: 70,
                      padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                      child:OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.indigo, side: const BorderSide(
                          color: Colors.indigoAccent,
                          width: 1.5,
                        )
                        ),
                        onPressed:(){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return StateAnother_ingredient(PageFlag: widget.PageFlag);
                              })
                          );
                        },
                        child: const Text('登録済み成分を選択',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                  Container(
                    height: 70,
                    width: 290,
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
                        aod.HanteiObligation();
                      },
                      child: const Text('決定',style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                          textAlign: TextAlign.center),
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}