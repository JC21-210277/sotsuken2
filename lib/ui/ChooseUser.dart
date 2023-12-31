import 'package:flutter/material.dart';

import '../DB/Database.dart';
import 'CreateUser1.dart';
import 'Obligation_allergy.dart';
import 'package:sotsuken2/Data/AllObligationData.dart';
import 'package:sotsuken2/Data/AllRecommendationData.dart';
import 'package:sotsuken2/Data/AllAnotherData.dart';

class StateChooseUser extends StatefulWidget{
  const StateChooseUser({super.key});

  @override
  State<StateChooseUser> createState(){
    return ChooseUser_Page();
  }
}

class ChooseUser_Page extends State<StateChooseUser>{

  AllObligationData aod = AllObligationData();
  AllRecommendationData ard = AllRecommendationData();
  AllAnotherData aad = AllAnotherData();

  void ReturnAndReload(int n) async{
    if(n == 0){
      await Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return const StateCreateUser1();
          })
      );
      setState((){});
    }else if(n == 1){
      await Navigator.pushNamed(context, 'SettingUser_page');
      setState((){
        debugPrint("とおった");
      });
    }

  }
  

  //AllUserData aud = AllUserData(username: AllUserData.sUserName);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          title: const Text('成分チェッカー')
      ),
      body: Center(
        child:SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Container(
                  margin: const EdgeInsets.all(13),
                  padding: const EdgeInsets.fromLTRB(40, 13, 40, 13),
                  color: Colors.indigo,
                  child: const FittedBox(
                    child:Text('ユーザーの選択',
                      style: TextStyle(
                          fontSize: 26,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:Colors.blue,
                      width: 1,
                    ),
                  ),
                  child:Container(
                    width: 265,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.blue,
                        width: 1,
                      ),
                    ),
                    child:Column(
                      children: [
                        if(DBProvider.userName.isEmpty)...[
                          Container(
                            margin:const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child:const Text('ユーザーが\n登録されていません',
                              style:TextStyle(
                                fontSize: 25,color:Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        for(String n in DBProvider.userName)...[
                          Container(
                            width: 240,
                            height: 47,
                            margin: const EdgeInsets.all(2),
                            child: OutlinedButton(
                              child:Text(n,style: const TextStyle(fontSize: 25),),
                              onPressed: () {},
                            ),
                          ),
                        ],

                      ],
                    ),


                  ),
                ),

                Container(
                  height: 55,
                  width: 270,
                  margin: const EdgeInsets.fromLTRB(0,10,0,5),
                  child:OutlinedButton(
                    style:OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: (){
                        ReturnAndReload(0);
                    },
                    child: const FittedBox(
                      child: Text('新しいユーザを登録',
                        style:TextStyle(
                          fontSize: 23,
                          color:Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 55,
                      width: 140,
                      child:OutlinedButton(
                        style:OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.deepOrange,
                          ),
                        ),
                        onPressed: (){
                          ReturnAndReload(1);
                        },
                        child: const Text('設定',
                          style:TextStyle(
                            fontSize: 23,
                            color:Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(5),
                        height: 55,
                        width: 140,
                        child:OutlinedButton(
                          style:OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          child: const Text('SKIP',
                            style:TextStyle(
                              fontSize: 23,
                              color:Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){
                            setState(() {
                              aod.AllResetObligation();
                              ard.AllResetRecommendation();
                              _selectAdd();
                            });
                            Future.delayed(const Duration (seconds: 1)).then((_){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return  StateObligation_allergy(PageFlag: 'ChooseUser');
                                }),
                              );
                              aad.AllResetAnother();
                            });
                          },
                        )
                    ),
                  ],
                ),
              ],
            )
        ),

      ),
    );
  }
  final dbProvider = DBProvider.instance;

  void _selectAdd() async {
    debugPrint('_selectAddにきました');
    final List<String> hiragana = await dbProvider.selectAdd();//ひらがなslectメソッド結果
    final List<String> import = DBProvider.AddList;//import結果
    debugPrint('追加成分の内容:$hiragana');
    debugPrint('Addlistをimportした結果：$import');
    debugPrint(DBProvider.AddList.toString());
  }
}