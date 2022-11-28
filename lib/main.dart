// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login_widget.dart';
import 'package:flutter_application_1/signin_widget.dart';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int selectedindex=0;

  List<String> _tabs=[
    "LOGIN",
    "SIGN UP"
  ];
  bool _autoValidate = false;

    void validateInputs() {
    if (formKey.currentState!.validate()) {
//    If all data are correct then save data to out variables
      formKey.currentState!.save();
      _autoValidate = false;
    } else {
      _autoValidate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Common().bagrouncolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                children: [
                  TextSpan(text: 'Social',style: TextStyle(color: Colors.white,fontSize: 24)),
                  TextSpan(text: 'X',style: TextStyle(color: Colors.white,fontSize: 32)),
                ]
              )),
            ],
          )
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Common().bagrouncolor),
                  borderRadius: BorderRadius.only(
                           bottomLeft: Radius.circular(20),
                           bottomRight: Radius.circular(20),
                         )
                ),
                child: TabBar(
                    onTap: (value){
                      setState(() {
                        selectedindex=value;
                      });
                    },
                     unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(horizontal: 0),
                    labelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    tabs: List<Widget>.generate(_tabs.length,
                        (int index) {
                    
                      return Tab(
                        child: 
                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width *0.5,
                        decoration: BoxDecoration(
                          color: selectedindex==index? Common().bagrouncolor:Colors.white,
                           borderRadius: BorderRadius.only(
                           bottomLeft: Radius.circular(16),
                           bottomRight: Radius.circular(20),
                         )
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(_tabs[index]),
                          ),
                        ),
                      ),);
                      
                    })),
              ),
              SizedBox(height: 10,),
              Container(
                 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                 height: MediaQuery.of(context).size.height *0.7,
                child: TabBarView(
                children:[
                  LoginWidget(),
                  SignUpWidget(),
                ],
           ),
              )
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: (){
            if(selectedindex==1){
            validateInputs();
            if (_autoValidate) return;
            }
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          child: Container(
            height: 60,
            child: Center(child:
            selectedindex ==0? 
            Text('LOGIN',style: TextStyle(fontSize: 20,color: Colors.white),):
            Text('REGISTER',style: TextStyle(fontSize: 20,color: Colors.white),)
            )
            ,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(20),
                           topRight: Radius.circular(20),
                         ),
              color: Common().bagrouncolor,
            ),
          ),
        ),
      ),
    );
  }
}
