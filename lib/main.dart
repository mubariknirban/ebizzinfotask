import 'package:ebizzinfotask/Addproduct.dart';
import 'package:ebizzinfotask/HomeScreen.dart';
import 'package:ebizzinfotask/Userdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'LoginPage.dart';
import 'Signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home_screen': (context) => Homescreen(),
        'Signup_screen': (context) => Signup(),
        'login_screen': (context) => Loginpage(),
        'Add_product': (context) => Addproduct(),
        'Add_tocart': (context) => Cartpage(),
        'Userprofile':(context)=> Userdetails()
      },
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homescreen();

          } else {
            return Loginpage();
          }
        },
      ),
    );
  }
}
