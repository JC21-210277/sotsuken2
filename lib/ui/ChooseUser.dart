import 'package:flutter/material.dart';

import 'CreateUser1.dart';
import 'Obligation_allergy.dart';
import 'SettingUser1.dart';

import 'package:sotsuken2/Data/AllUserData.dart';

class StateChooseUser extends StatefulWidget{
  const StateChooseUser({super.key});

  @override
  State<StateChooseUser> createState(){
    return ChooseUser_Page();
  }
}

String valueName1 = "";
String valueName2 = "";
String valueName3 = "";
String valueName4 = "";
String valueName5 = "";

class ChooseUser_Page extends State<StateChooseUser>{

  void ReturnAndReload(int n) async{
    if(n == 0){
      await Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return const StateCreateUser1();
          })
      );
    }else if(n == 1){
      await Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return const StateUserSettings1();
          })
      );
    }
    setState(() {

      AllUserData aud = AllUserData(username: AllUserData.sUserName);
      int aaa = aud.getUserNames().length;
      debugPrint(aaa.toString());
      valueName1 = "";
      valueName2 = "";
      valueName3 = "";
      valueName4 = "";
      valueName5 = "";
      for(int n = 1; n <= aud.getUserNames().length;n++){
        switch (n){
          case 5 :
            valueName5 = aud.getUserNames()[4];
          case 4 :
            valueName4 = aud.getUserNames()[3];
          case 3 :
            valueName3 = aud.getUserNames()[2];
          case 2 :
            valueName2 = aud.getUserNames()[1];
          case 1 :
            valueName1 = aud.getUserNames()[0];
            break;
          default:
          //エラーのポップアップとかできないかな
        }
      }
    });
  }

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
                        Container(
                          width: 240,
                          height: 47,
                          margin: const EdgeInsets.all(2),
                          child: OutlinedButton(
                            child:Text(valueName1,style: const TextStyle(fontSize: 25),),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 240,
                          height: 47,
                          margin: const EdgeInsets.all(2),
                          child: OutlinedButton(
                            child:Text(valueName2,style: const TextStyle(fontSize: 25),),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 240,
                          height: 47,
                          margin: const EdgeInsets.all(2),
                          child: OutlinedButton(
                            child:Text(valueName3,style: const TextStyle(fontSize: 25),),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 240,
                          height: 47,
                          margin: const EdgeInsets.all(2),
                          child: OutlinedButton(
                            child:Text(valueName4,style: const TextStyle(fontSize: 25),),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 240,
                          height: 47,
                          margin: const EdgeInsets.all(2),
                          child: OutlinedButton(
                            child:Text(valueName5,style: const TextStyle(fontSize: 25),),
                            onPressed: () {},
                          ),
                        ),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context){
                                return  StateObligation_allergy(PageFlag: 0);
                              }),
                            );
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
}