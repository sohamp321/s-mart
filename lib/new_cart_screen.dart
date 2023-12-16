// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart/cart.dart';
import 'package:smart/payment.dart';
import 'package:smart/phone.dart';
import 'package:smart/product_page.dart';
import 'firebase_options.dart';
import 'cart_model.dart';
import 'cart_provider.dart';
import 'db_helper.dart';
import 'dart:ui';

var pixelRatio = window.devicePixelRatio;

//Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;

class CartScreen2 extends StatefulWidget {
  const CartScreen2({Key? key}) : super(key: key);
  static var total='';

  @override
  State<CartScreen2> createState() => _CartScreen2State();
}

class _CartScreen2State extends State<CartScreen2> {
  final auth = FirebaseAuth.instance;
  final ref =
  FirebaseDatabase.instance.ref("Users").child(MyPhone.name).child("cart");
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  // final ref = FirebaseDatabase.instance.ref();
  final cartdb = FirebaseDatabase.instance.ref();

  int total_Price = 0;
  // DatabaseReference cartRef = FirebaseDatabase.instance.ref().child("Users").child("Soham").child("cart");
  // Stream<double> _getTotalValue() async* {
  //   final cartRef =
  //       FirebaseDatabase.instance.ref("Users").child("Soham").child("cart");
  //   await for (var dataSnapshot in cartRef.onValue) {
  //     double totalValue = 0;
  //     if (dataSnapshot.value != null) {
  //       dataSnapshot.value.forEach((key, value) {
  //         totalValue += value['price'] * value['quantity'];
  //       });
  //     }
  //     yield totalValue;
  //   }
  // }

  Future<void> totalPrice() async {
    DataSnapshot snap2 = await ref.get();

    print("yahan tak chalra");

    print(snap2
        .value);



    int temp_total_price = 0;

    Map<dynamic, dynamic> Cart = snap2
        .value as Map<dynamic, dynamic>;

    // print("Yahin se print");
    print(Cart);

    for (var product in Cart.keys) {
      print(product);
      print(Cart[product]['initialPrice']);
      print(Cart[product]['productPrice']);

      temp_total_price += int.parse(Cart[product]['productPrice']);
    }

    print(temp_total_price);

    // print(Cart[product]['quantity']);
    // print(Cart[product]['price'] * Cart[product]['quantity']);

    setState(() {
      total_Price = temp_total_price;
    });
  }

  @override
  void initState() {
    totalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final cart = CartProvider();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber.shade300,
      //   title: Text(
      //     'MyCart',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 30,
      //       fontFamily: 'Gloock-Regular',
      //       color: Colors.black87,
      //     ),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     color: Colors.black87,
      //     onPressed: () {
      //       Navigator.pushNamedAndRemoveUntil(
      //           context, '/screen', (route) => false);
      //     },
      //   ),
      // ),
      body: Container(
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height:safeHeight*0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.amber.shade100),

                child:Row(
                  children: [
                    Column(
                      children:[
                        SizedBox(height:25),
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          constraints: BoxConstraints(),
                          color: Colors.black87,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/screen', (route) => false);
                            // Navigator.pushReplacementNamed(context, '/screen');
                          },
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Spacer(),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,0,20),
                          child: Text(
                            'My Cart',
                            style:TextStyle(
                              fontFamily:'Gloock-Regular',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],

                    ),
                    Spacer(),
                    Column(
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/cart.png',
                            height:safeHeight*0.25,
                            width:safeWidth*0.5,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return ListTile(
                      title: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                Border.all(color: Colors.grey, width: 3),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Image.network(
                                        height: safeHeight * 0.125,
                                        width: safeWidth * 0.275,
                                        snapshot
                                            .child('image')
                                            .value
                                            .toString()),
                                  ),
                                  SizedBox(
                                    height: 10,
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              // SizedBox(width: 20,),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Text(
                                                  snapshot
                                                      .child('productName')
                                                      .value
                                                      .toString(),
                                                  // Text(chip['productName'].tostring(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),

                                              // SizedBox(width: 20,),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Text(
                                                  'Rs. ' +
                                                      snapshot
                                                          .child('productPrice')
                                                          .value
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                        SizedBox(width: 20),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 5, bottom: 5),
                                              width: 90,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.amber.shade300,
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                        onTap: () async {
                                                          Object? quantity =
                                                              snapshot
                                                                  .child(
                                                                  'quantity')
                                                                  .value;
                                                          Object? price = snapshot
                                                              .child(
                                                              'initialPrice')
                                                              .value;

                                                          int int_q = int.parse(
                                                              quantity
                                                                  .toString());
                                                          int int_price =
                                                          int.parse(price
                                                              .toString());
                                                          if (int_q > 1) {
                                                            int_q--;
                                                          }

                                                          int newPrice =
                                                              int_price * int_q;

                                                          ref
                                                              .child(snapshot
                                                              .child(
                                                              'productName')
                                                              .value
                                                              .toString())
                                                              .update({
                                                            'quantity': int_q,
                                                          });
                                                          ref
                                                              .child(snapshot
                                                              .child(
                                                              'productName')
                                                              .value
                                                              .toString())
                                                              .update({
                                                            'productPrice':
                                                            newPrice
                                                                .toString(),
                                                          });
                                                          totalPrice();
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        )),
                                                    Text(
                                                      snapshot
                                                          .child('quantity')
                                                          .value
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () async {
                                                          Object? quantity =
                                                              snapshot
                                                                  .child(
                                                                  'quantity')
                                                                  .value;
                                                          Object? price = snapshot
                                                              .child(
                                                              'initialPrice')
                                                              .value;

                                                          int int_q = int.parse(
                                                              quantity
                                                                  .toString());
                                                          int int_price =
                                                          int.parse(price
                                                              .toString());

                                                          int_q++;
                                                          int newPrice =
                                                              int_price * int_q;

                                                          ref
                                                              .child(snapshot
                                                              .child(
                                                              'productName')
                                                              .value
                                                              .toString())
                                                              .update({
                                                            'quantity': int_q,
                                                            'productPrice':
                                                            newPrice
                                                                .toString(),
                                                          });
                                                          totalPrice();
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Text(
                            //   '$total_Price',
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 15,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Total Price\nRs.$total_Price',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: safeHeight * 0.0435,
                      width: safeWidth * 0.37,
                      child: ElevatedButton(
                        onPressed: () async {
                          DataSnapshot snap = await ref.get();
                          DataSnapshot snap2 = await cartdb.get();

                          // final dbRef = FirebaseDatabase.instance
                          //     .ref()
                          //     .child('Users')
                          //     .child("Soham")
                          //     .child("cart");
                          // dbRef.once().then((DataSnapshot snapshot) {
                          //       Map<dynamic, dynamic>? values = snapshot.value as Map?;
                          //       values?.forEach((key, values) {
                          //         values.forEach((key, value) {
                          //           print(value);
                          //         });
                          //       });
                          //     } as FutureOr Function(DatabaseEvent value));

                          print("hawa hawa hawa khusboo luta de");

                          // String reciveddata =
                          //     snap2.child("Users").child('nav').child("cart");
                          // print(reciveddata);
                          // String jsonstring = jsonEncode(reciveddata);
                          // Map<String, dynamic> user = jsonDecode(jsonstring);

                          // print(user);
                          // print('We sent the verification link to }.');

                          // await FirebaseDatabase.instance
                          //     .ref("Users")
                          //     .child('nav')
                          //     .child('cart')
                          //     .once()
                          //     .then((DatabaseEvent event) {
                          //       DataSnapshot snapshot = event.snapshot;
                          //       Map<dynamic, dynamic> values =
                          //           snapshot.value as Map<dynamic, dynamic>;
                          //       values.forEach((key, values) {
                          //         Map<dynamic, dynamic> grandChildren = values['productPrice'];
                          //         grandChildren.forEach((key, value) {
                          //           print(value);
                          //         });
                          //       });
                          //     } as FutureOr Function(DatabaseEvent value));

                          //   FirebaseDatabase.instance
                          //     .reference()
                          //     .child('parent')
                          //     .get()
                          //     .then((DataSnapshot snapshot) {
                          //   Map<dynamic, dynamic> values = snapshot.value;
                          //   values.forEach((key, values) {
                          //     print(values['childName']);
                          //   });
                          // });

                          //get the key values of the child of cart

                          //

                          cartdb
                              .child("Users")
                              .child(MyPhone.name)
                              .child("pastOrders")
                              .push()
                              .set(snap2
                              .child("Users")
                              .child(MyPhone.name)
                              .child("cart")
                              .value);

                          cartdb
                              .child("ToDeliver")
                              .child(MyPhone.name)
                              .child("data")
                              .set(snap2
                              .child("Users")
                              .child(MyPhone.name)
                              .child("data")
                              .value);
                          cartdb
                              .child("ToDeliver")
                              .child(MyPhone.name)
                              .child("cart")
                              .set(snap2
                              .child("Users")
                              .child(MyPhone.name)
                              .child("cart")
                              .value);

                          cartdb
                              .child("Users")
                              .child(MyPhone.name)
                              .child("cart")
                              .remove();
                          // var int = total_Price;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Payment(total_price: total_Price)));
                          // ignore: use_build_context_synchronously
                          // Navigator.pushReplacementNamed(context, '/payment');
                        },
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Montserrat-Bold',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber.shade400,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            // Set the desired circular radius here
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 70.0,
              // ),
            ],
          )),
      // StreamBuilder<double>(
      //   stream: _getTotalValue(),
      //   builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
      //     if (snapshot.hasData) {
      //       return Text('Total Value: \${snapshot.data}');
      //     } else if (snapshot.hasError) {
      //       return Text('Error: \${snapshot.error}');
      //     }
      //     return CircularProgressIndicator();
      //   },
      // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async {
      //     // get uid from firebase
      //     cartdb.child("Users").child(MyPhone.name).child("data").set({
      //       "name": "Soham Parikh",
      //       "phone": "9429370973",
      //       "address": "G5-350",
      //     });
      //     DataSnapshot snap = await ref.get();
      //     DataSnapshot snap2 = await cartdb.get();

      //     // final dbRef = FirebaseDatabase.instance
      //     //     .ref()
      //     //     .child('Users')
      //     //     .child("Soham")
      //     //     .child("cart");
      //     // dbRef.once().then((DataSnapshot snapshot) {
      //     //       Map<dynamic, dynamic>? values = snapshot.value as Map?;
      //     //       values?.forEach((key, values) {
      //     //         values.forEach((key, value) {
      //     //           print(value);
      //     //         });
      //     //       });
      //     //     } as FutureOr Function(DatabaseEvent value));

      //     print("hawa hawa hawa khusboo luta de");

      //     // String reciveddata =
      //     //     snap2.child("Users").child('nav').child("cart");
      //     // print(reciveddata);
      //     // String jsonstring = jsonEncode(reciveddata);
      //     // Map<String, dynamic> user = jsonDecode(jsonstring);

      //     // print(user);
      //     // print('We sent the verification link to }.');

      //     // await FirebaseDatabase.instance
      //     //     .ref("Users")
      //     //     .child('nav')
      //     //     .child('cart')
      //     //     .once()
      //     //     .then((DatabaseEvent event) {
      //     //       DataSnapshot snapshot = event.snapshot;
      //     //       Map<dynamic, dynamic> values =
      //     //           snapshot.value as Map<dynamic, dynamic>;
      //     //       values.forEach((key, values) {
      //     //         Map<dynamic, dynamic> grandChildren = values['productPrice'];
      //     //         grandChildren.forEach((key, value) {
      //     //           print(value);
      //     //         });
      //     //       });
      //     //     } as FutureOr Function(DatabaseEvent value));

      //     //   FirebaseDatabase.instance
      //     //     .reference()
      //     //     .child('parent')
      //     //     .get()
      //     //     .then((DataSnapshot snapshot) {
      //     //   Map<dynamic, dynamic> values = snapshot.value;
      //     //   values.forEach((key, values) {
      //     //     print(values['childName']);
      //     //   });
      //     // });

      //     //get the key values of the child of cart

      //     //

      //     cartdb
      //         .child("Users")
      //         .child(MyPhone.name)
      //         .child("pastOrders")
      //         .push()
      //         .set(
      //             snap2.child("Users").child(MyPhone.name).child("cart").value);

      //     cartdb.child("ToDeliver").child(MyPhone.name).child("data").set(
      //         snap2.child("Users").child(MyPhone.name).child("data").value);
      //     cartdb.child("ToDeliver").child(MyPhone.name).child("cart").set(
      //         snap2.child("Users").child(MyPhone.name).child("cart").value);

      //     cartdb.child("Users").child(MyPhone.name).child("cart").remove();
      //     // ignore: use_build_context_synchronously
      //     Navigator.pushReplacementNamed(context, '/Thanks');
      //   },
      //   label: Text(
      //     'Place Order',
      //     style: TextStyle(
      //       fontSize: 30.0,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black87,
      //       fontFamily: 'Montserrat-Bold',
      //     ),
      //   ),
      //   backgroundColor: Colors.amber,
      //   elevation: 0.0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
