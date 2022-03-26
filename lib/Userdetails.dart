import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebizzinfotask/Model/Usermodel.dart';
import 'package:flutter/material.dart';

import 'Colorfile.dart';


class Userdetails extends StatefulWidget {
  const Userdetails({Key? key}) : super(key: key);

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {


  Future<List<UserModel>> retrieveUserModels() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection("Userdetails").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  TextStyle headerstyle = TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 20);

  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('Userdetails').snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveUserModels();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primarycolor,
          iconTheme: IconThemeData(color: Secondarycolor),
          title: Text("Users List"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: FutureBuilder(
                  future: retrieveUserModels(),
                  builder:  (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot){

                    final data = snapshot.requireData;

                    return ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index){

                          return Card(
                            margin: EdgeInsets.all(10),
                            shadowColor: Colors.grey,
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("User Name:- ",style: TextStyle(color: Colors.blue),),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(data[index].name)
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("User Email:- ",style: TextStyle(color: Colors.blue),),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(data[index].email)
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("User Age:- ",style: TextStyle(color: Colors.blue),),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(data[index].age)
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("User DOB :- ",style: TextStyle(color: Colors.blue),),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(data[index].dob)
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );

                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
