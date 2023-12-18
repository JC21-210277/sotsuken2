import 'package:flutter/material.dart';
import 'package:sotsuken2/ui/AllergyDetection.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';
import 'package:sotsuken2/ui/Another_ingredient.dart';


class StateRecommendation_allergy extends StatefulWidget{
  final int PageFlag;
  const StateRecommendation_allergy({Key?key, required this.PageFlag}): super(key:key) ;

  @override
  State<StateRecommendation_allergy> createState(){
    return Recommendation_allergy();
  }
}

class Recommendation_allergy extends State<StateRecommendation_allergy> {
//チェックボックスの数だけいる(20)

  AllRecommendationData ard = AllRecommendationData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('成分チェッカー'),
      ),
      body: Center(
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                decoration:BoxDecoration(
                  border: Border.all(
                    color:Colors.indigo,
                    width: 1,
                  ),
                ),
                child: const Text('表示推奨アレルギー',
                    style: TextStyle(
                        fontSize: 25,
                        color:Colors.indigo,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),

              for(int n = 0 ; n < 18; n = n+2)...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int nn = 0 ; nn < 2  ; nn++)...[
                      if(nn == 0)...[
                        Container(
                            width:170,
                            child:Transform.scale(
                                scale:1.2,
                                child:CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.leading,
                                    title: Transform.translate(
                                      offset: const Offset(-15,0),
                                      child:Text(ard.getValue()[n+nn],style: TextStyle(fontSize: 20)),
                                    ),
                                    value: ard.getBool()[n+nn],
                                    onChanged: (value) {
                                      setState(() {
                                        ard.getBool()[n+nn] = value!;
                                      });
                                    }
                                )
                            )
                        ),
                      ]else...[
                        if(n+1 == 17)...[
                          Container(
                            width: 160,
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
                                    child:Text(ard.getValue()[n+nn],style: TextStyle(fontSize: 20)),
                                  ),
                                  value: ard.getBool()[n+nn],
                                  onChanged: (value) {
                                    setState(() {
                                      ard.getBool()[n+nn] = value!;
                                    });
                                  }
                              ),
                            ),
                          ),
                        ],
                      ],
                    ],
                  ],
                ),
              ],
              for(int n = 18 ; n < 20 ; n++ )...[
                Container(
                  width: 303,
                  child:Transform.scale(
                    scale:1.2,
                    child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Transform.translate(
                          offset: const Offset(-15,0),
                          child:Text(ard.getValue()[n],style: TextStyle(fontSize: 20)),
                        ),
                        value: ard.getBool()[n],
                        onChanged: (value) {
                          setState(() {
                            ard.getBool()[n] = value!;
                          });
                        }
                    ),
                  ),
                ),
              ],
              if(widget.PageFlag == 0)...[
                Container(
                  width: 290,
                  height: 70,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                  child:OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.indigoAccent,
                          width: 1.5,
                        ),
                        primary:Colors.indigo
                    ),
                    onPressed:(){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return StateAnother_ingredient(PageFlag:widget.PageFlag);
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
                width: 290,
                height: 70,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                padding:const EdgeInsets.fromLTRB(0, 7, 0, 7),
                child:  OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.deepOrange,
                        width: 1.5,
                      ),
                      primary:Colors.deepOrange
                  ),
                  onPressed:(){
                    if(widget.PageFlag == 0){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const StateAllergyDetection();
                          })
                      );
                    }else if(widget.PageFlag == 1){
                      //なおしたいNamdpush
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }
                    debugPrint(widget.PageFlag.toString());
                    ard.HanteiRecommendation();
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
        ),

      ),
    );
  }
}
