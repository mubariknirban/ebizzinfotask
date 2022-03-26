import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Colorfile.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  _launchURL() async {
    const url = 'https://play.google.com/store/apps/details?id=com.aasha.newaashaflutter';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;


  TextEditingController emailornumber = TextEditingController();
  TextEditingController passwordedit = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController userage = TextEditingController();
  TextEditingController userdob = TextEditingController();

  void maind() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maind();
  }




  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Secondarycolor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                ),
                margin: EdgeInsets.only(top: 50),
                child: Icon(Icons.person,size: 100,),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text("Create",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Primarycolor,fontStyle: FontStyle.italic,shadows: [Shadow(color: Colors.white,offset: Offset(0, -5))]),)
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text("Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Primarycolor,fontStyle: FontStyle.italic,shadows: [Shadow(color: Colors.white,offset: Offset(0,-5))]),)
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10,top: 30),
                child: TextFormField(
                    controller:username ,
                    decoration: InputDecoration(
                        labelText: "Your Name",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
                        prefixIcon: Icon(Icons.drive_file_rename_outline,size: 30,color: Primarycolor,),
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
                    controller: emailornumber,
                    decoration: InputDecoration(
                        labelText: "Your Email",
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
                    controller: userdob,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Your DOB DD-MM-YYYY",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
                        prefixIcon: Icon(Icons.drive_file_rename_outline,size: 30,color: Primarycolor,),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
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
                    controller: userage,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Your Age",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
                        prefixIcon: Icon(Icons.drive_file_rename_outline,size: 30,color: Primarycolor,),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
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
                    controller: passwordedit,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
                        prefixIcon: Icon(Icons.lock,size: 30,color: Primarycolor,),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
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

                    if(username.text == "" || emailornumber.text == "" || userage.text =="" || userdob.text == "" || passwordedit.text == ""){


                      final snackBar = SnackBar(
                        backgroundColor: Colors.red[900],
                        content: Text("Please Enter All the Details" + " !!!",style: TextStyle(color: Colors.yellowAccent),textAlign: TextAlign.center),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }else{


                      setState(() {
                        showSpinner = true;
                      });

                      FirebaseFirestore.instance
                          .collection('Userdetails')
                          .add({
                        'Name': username.text,
                        'age': userage.text,
                        'dob': userdob.text,
                        'email': emailornumber.text,},);


                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: emailornumber.text, password: passwordedit.text);
                        if (newUser != null) {
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.pushNamed(context, 'login_screen');
                        }
                      } catch (e) {
                        print(e);

                        setState(() {
                          showSpinner = false;
                        });

                        final snackBar = SnackBar(
                          backgroundColor: Colors.red[900],
                          content: Text(e.toString() + " !!!",style: TextStyle(color: Colors.yellowAccent),textAlign: TextAlign.center),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }


                    }



                  },
                  child:showSpinner == true ? Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ) :Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
