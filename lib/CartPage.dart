import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Colorfile.dart';


class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {

  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('addtocart').snapshots();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Secondarycolor),
          backgroundColor: Primarycolor,
          title: Text("My Cart"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child:  Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: users,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {


                  if(snapshot.hasError){

                    return Text("Something Went Wrong");

                  }

                  if(snapshot.connectionState == ConnectionState.waiting){

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                      itemCount: data.size,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Product Name:- ",style: TextStyle(color: Colors.blue),),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(data.docs[index]['Name'])
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Text("Product Price:- ",style: TextStyle(color: Colors.blue),),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text("\u{20B9}" +data.docs[index]['price'])
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Text("Product Size:- ",style: TextStyle(color: Colors.blue),),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(data.docs[index]['size'])
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Text("Description :- ",style: TextStyle(color: Colors.blue),),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                                width: 200,
                                                child: Text(data.docs[index]['dec'],overflow: TextOverflow.ellipsis,maxLines: 1,))
                                          ],
                                        ),

                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.black
                                          )
                                      ),
                                      child: Icon(Icons.add_shopping_cart),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  color: Colors.black,
                                  height: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: ()async{

                                        },
                                        child: Text("Buy Now",style: TextStyle(color: Colors.green),)),
                                    Container(
                                      color: Colors.black,
                                      height: 40,
                                      width: 1,
                                    ),
                                    TextButton(
                                        onPressed: ()async{

                                          await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                                            await myTransaction.delete(data.docs[index].reference);
                                          });

                                        },
                                        child: Text("Remove",style: TextStyle(color: Colors.red)))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );

                      });




                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
