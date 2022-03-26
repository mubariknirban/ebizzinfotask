
import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Colorfile.dart';



class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {


  final _auth = FirebaseAuth.instance;

  TextEditingController useremail = TextEditingController();
  TextEditingController password = TextEditingController();


  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        bottomSheet: Container(height: 20,color: Primarycolor,) ,
        backgroundColor: Secondarycolor,
        body:SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text("Welcome to",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Primarycolor,fontStyle: FontStyle.italic,shadows: [Shadow(color: Colors.white,offset: Offset(0, -5))]),)
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text("Flutter",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Primarycolor,fontStyle: FontStyle.italic,shadows: [Shadow(color: Colors.white,offset: Offset(0,-5))]),)
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10,top: 40),
                child: TextFormField(
                    controller: useremail,
                    decoration: InputDecoration(
                        labelText: "Enter Email id",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
                        prefixIcon: Icon(Icons.email,size: 30,color: Primarycolor,),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 10
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Primarycolor,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(20),
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: TextFormField(
                     controller: password,
                     decoration: InputDecoration(
                        labelText: "Enter Password",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
                        prefixIcon: Icon(Icons.lock,size: 30,color: Primarycolor,),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 10
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Primarycolor,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(20),
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Primarycolor,
                      onPrimary: Secondarycolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      )
                  ),
                  onPressed: () async{

                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();

                    if(useremail.text == "" || password.text == ""){

                      final snackBar2 = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Please Enter Valid Id or Password",style: TextStyle(color: Colors.yellow),textAlign: TextAlign.center),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                    }else{

                      setState(() {
                        isloading = true;
                      });

                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: useremail.text, password: password.text);
                        if (user != null) {
                          setState(() {
                            isloading = false;
                          });
                          Navigator.pushNamed(context, 'home_screen');
                        }
                      } catch (e) {
                        print(e);

                        setState(() {
                          isloading = false;
                        });
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString(),style: TextStyle(color: Colors.yellow),textAlign: TextAlign.center),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }


                  },
                  child: isloading == true ? Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ): Text("Login"),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text("OR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Signup_screen');
                    },
                    child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Primarycolor,fontStyle: FontStyle.italic),),
                  )
              )

            ],
          ),
        ) ,
      ),
    );
  }
}
