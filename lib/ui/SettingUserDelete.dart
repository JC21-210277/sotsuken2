import 'package:flutter/material.dart';
import 'ChooseUser.dart';

import 'package:sotsuken2/Data/AllUserData.dart';

class StateSettingUserDelete extends StatefulWidget{
  final String UserName;

  StateSettingUserDelete(this.UserName);

  @override
  State<StateSettingUserDelete> createState(){
    return SettingUserDelete();
  }
}

class SettingUserDelete extends State<StateSettingUserDelete>{
  bool Agree = false;
  String UN = "";
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
                    padding:const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    color:Colors.red,
                    child:const Text('ユーザーの削除',
                      style: TextStyle(
                          fontSize: 28,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Container(
                    width: 310,
                    child:Transform.scale(
                        scale: 1.2,
                        child:CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title:Transform.translate(
                              offset: const Offset(-15, 0),
                              child:const Text('このユーザーを削除する',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                            value: Agree,
                            onChanged:(value) {
                              setState(() {
                                Agree = value!;
                              });
                            }
                        )

                    ),
                  ),

                  Container(
                    margin:const EdgeInsets.fromLTRB(10,20,10,10),
                    child:const Text('削除するユーザー名を\n入力してください',
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.fromLTRB(10,10,10,10),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red)
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
                  Container(
                      width: 200,
                      height:60,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child:ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child:const Text('削除',style: TextStyle(fontSize: 28),),
                        onPressed: (){
                          setState(() {
                            if(widget.UserName == UN && Agree == true){
                              AllUserData aud = AllUserData(username: AllUserData.sUserName);
                              aud.deleteUserName(widget.UserName);
                            }else{
                              //エラーメッセが欲しいけど今出す場所ない
                            }
                          });
                          //ユ－ザー選択画面(ChooseUser)
                          Navigator.popUntil(context,ModalRoute.withName('ChooseUser_page'));
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