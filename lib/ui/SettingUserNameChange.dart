import 'package:flutter/material.dart';

import 'package:sotsuken2/Data/AllUserData.dart';

class StateSettingUserNameChange extends StatefulWidget{
  final String UserName;
  const StateSettingUserNameChange(this.UserName);

  @override
  State<StateSettingUserNameChange> createState(){
    return SettingUserNameChange();
  }
}

class SettingUserNameChange extends State<StateSettingUserNameChange>{
  String afterName = "";

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
                    padding:const EdgeInsets.fromLTRB(20, 12, 20, 12),
                    color:Colors.deepOrange,
                    child:const FittedBox(
                      child:Text('ユーザー名の変更',
                        style: TextStyle(
                            fontSize: 28,
                            color:Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),

                  Container(
                    child:Container(
                      width: 280,
                      height: 60,
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color:Colors.deepOrangeAccent
                            )
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width:60,
                            child: const Icon(
                              Icons.account_box,
                              color: Colors.redAccent,
                              size:50,
                            ),
                          ),
                          Container(
                            width: 220,
                            child:Text(widget.UserName,style: const TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin:const EdgeInsets.fromLTRB(10,20,10,10),
                    child:const Text('新しいユーザー名を\n入力してください',
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
                          afterName = value;
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
                          backgroundColor: Colors.deepOrange,
                        ),
                        child:const Text('更新',style: TextStyle(fontSize: 28),),
                        onPressed: (){
                          setState(() {
                            AllUserData aud = AllUserData(username: AllUserData.sUserName);
                            aud.changeUserName(widget.UserName,afterName);
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