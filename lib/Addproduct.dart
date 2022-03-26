import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:ebizzinfotask/Colorfile.dart';
import 'package:flutter/material.dart';


class Addproduct extends StatefulWidget {
  const Addproduct({Key? key}) : super(key: key);

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {


  TextEditingController prodtname = TextEditingController();
  TextEditingController prodsize = TextEditingController();
  TextEditingController prodsec = TextEditingController();
  TextEditingController prodprice = TextEditingController();

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

  List<bool> sized = [true, false, false, false];
  int sizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Secondarycolor),
          backgroundColor: Primarycolor,
          title: Text("Product Details",style: TextStyle(color: Secondarycolor),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black
                    )
                ),
                margin: EdgeInsets.only(top: 50),
                child: Icon(Icons.add_shopping_cart,size: 50,),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text("Add Product Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Primarycolor,fontStyle: FontStyle.italic,shadows: [Shadow(color: Colors.white,offset: Offset(0, -5))]),)
              ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10,top: 30),
                child: TextFormField(
                    controller: prodtname,
                    decoration: InputDecoration(
                        labelText: "Product Name",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
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
                    controller: prodprice,
                    decoration: InputDecoration(
                        labelText: "Product Price",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
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
                  controller: prodsec,
                    decoration: InputDecoration(
                        labelText: "Product Description",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
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
                    controller: prodsize,
                    decoration: InputDecoration(
                        labelText: "Product Size",
                        labelStyle: TextStyle(
                          color: Primarycolor,
                        ),
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


                    FirebaseFirestore.instance
                        .collection('Productdetails')
                        .add({
                      'description': prodsec.text,
                      'price': prodprice.text,
                      'productname': prodtname.text,
                      'size': prodsize.text,},);


                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      text: "Your Product Added successful!",
                      onConfirmBtnTap: (){
                        Navigator.pushNamed(context, "home_screen");
                      }
                    );




                  },
                  child:Text("ADD"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
