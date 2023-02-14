import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebizzinfotask/Colorfile.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('Productdetails').snapshots();

  final _animationDuration = Duration(seconds: 1 );
  late Timer timer;
  late Color _color;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(_animationDuration, (timer) => changeclr());
    _color = Colors.white;
  }

  void changeclr(){

    final newColor = _color == Colors.white ? Secondarycolor: Colors.white;

    setState(() {
      _color = newColor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(

        appBar: AppBar(
          title: Text("Home Page",style: TextStyle(color: Secondarycolor),),
          backgroundColor: Primarycolor,
          iconTheme: IconThemeData(color: Secondarycolor),
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "Userprofile");
              },
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.person)),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "Add_tocart");
              },
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.shopping_cart_rounded)),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Primarycolor,
          onPressed: () {
            Navigator.pushNamed(context, "Add_product");
          },
          icon: const Icon(Icons.add,color: Secondarycolor,),
          label: const Text('Add Products',style: TextStyle(color:Secondarycolor ),),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    labelText: "Search Products",
                    suffixIcon: Icon(Icons.search,color: Colors.black,),
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 1
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 1
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.black,
                height: 5,
              ),
              Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                    color: Primarycolor,
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(50)

                            ),
                            child: ClipOval(
                              child: Image.asset('assets/shirtsimg.png',fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("SHIRTS",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Primarycolor,
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(50)

                            ),
                            child: ClipOval(
                              child: Image.asset('assets/watchimg.png',fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("WATCHES",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                    color: Primarycolor,
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(50)

                            ),
                            child: ClipOval(
                              child: Image.asset('assets/shoesimg.png',fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("SHOES",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                    color: Primarycolor,
                                    width: 2
                                ),
                                borderRadius: BorderRadius.circular(50)

                            ),
                            child: ClipOval(
                              child: Image.asset('assets/jeansimg.png',fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("JEANS",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
              ),
              Container(
                color: Colors.black,
                height: 5,
              ),
              Container(
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

                          return Container(
                            height: 100,
                            child:Card(
                              elevation: 5,
                              shadowColor: Colors.grey,
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset('assets/shopingimg.png',),
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10,top: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Product Name:- "+data.docs[index]['productname'],style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 14),),
                                            Text("Product Size:- "+data.docs[index]['size'],style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 14),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text("Price: \u{20B9}  " +data.docs[index]['price'],style: TextStyle(fontWeight: FontWeight.bold),),
                                                ),
                                                AnimatedContainer(
                                                  duration: _animationDuration,
                                                  child: GestureDetector(
                                                    onTap: (){

                                                      FirebaseFirestore.instance
                                                          .collection('addtocart')
                                                          .add({
                                                        'Name': data.docs[index]['productname'],
                                                        'dec': data.docs[index]['description'],
                                                        'price': data.docs[index]['price'],
                                                        'size': data.docs[index]['size'],},);


                                                      Navigator.pushNamed(context, "Add_tocart");


                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 5,bottom: 5,right: 10),
                                                      padding: EdgeInsets.all(3),
                                                      decoration: BoxDecoration(
                                                          color: Primarycolor,
                                                          borderRadius: BorderRadius.circular(40)
                                                      ),
                                                      child: Text("Add To Cart",style: TextStyle(fontStyle: FontStyle.italic,color: _color),),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          );

                        });


                    /*ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      child: Center(child: Text(document['name'])),
                    );
                  }).toList(),
                );*/


                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
