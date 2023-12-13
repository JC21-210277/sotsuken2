import 'package:flutter/material.dart';
import 'ui/ChooseUser.dart';
import 'package:sotsuken2/Data/AllUserData.dart';

void main() {
  runApp(const MyApp());    //const無くても動く(下とセット)
}

class MyApp extends StatelessWidget{
  const MyApp({super.key}); //無くても動く(上とセット)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'タイトル',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        routes: {
          'ChooseUser_page':(context){
            return const StateChooseUser();
          }
        },
        home: Home_Page_State()
    );
  }
}

class Home_Page_State extends StatefulWidget{
  State<Home_Page_State> createState(){
    return Home_Page();
  }
}

class Home_Page extends State<Home_Page_State>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text('成分チェッカー'),
      ),
      body: Center(

        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Container(
                height:500,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/milk.png'),
                      fit:BoxFit.contain
                  ),
                ),
                child:Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30,50,30,40),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1,
                          ),
                        ),
                        child:Container(
                            margin: const EdgeInsets.fromLTRB(10,10,10,10),
                            padding: const EdgeInsets.fromLTRB(25,15,25,15),
                            decoration: BoxDecoration(
                              color:Colors.white,
                              border: Border.all(
                                color: Colors.indigo,
                                width: 1,
                              ),
                            ),
                            child: const FittedBox(
                              child: Text('成分チェッカー',
                                style: TextStyle(
                                    fontSize: 27,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        height: 55,
                        width: 210,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo
                          ),
                          child: const Text('食品',style: TextStyle(fontSize: 30),),
                          onPressed: (){
                            Navigator.pushNamed(context, 'ChooseUser_page');
                            setState(() {
                              AllUserData aud = AllUserData(username: AllUserData.sUserName);
                              switch (aud.getUserNames().length) {
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
                              }
                              //エラーのポップアップとかできないかな
                            });
                          },
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(20),
                          height: 55,
                          width: 210,
                          child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo
                            ),
                            onPressed: (){},
                            child: const Text('美容',style: TextStyle(fontSize: 30),),
                          )
                      ),

                      Container(
                        margin: const EdgeInsets.fromLTRB(0,30,0,20),
                        //padding:const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        height: 50,
                        width: 210,
                        color: Colors.white,
                        child:OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color:Colors.deepOrange
                              )
                          ),
                          child: const Text('ご利用方法',
                              style: TextStyle(fontSize: 25,
                                  color:Colors.deepOrange
                              )
                          ),
                          onPressed: () {},
                        ),
                      )
                    ]
                ),
              ),

            ]
        ),
      ),
    );
  }
}