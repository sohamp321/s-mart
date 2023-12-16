import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'cart_model.dart';
import 'cart_provider.dart';
import 'db_helper.dart';
import 'package:smart/phone.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
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

class ProductPage extends StatefulWidget {
  final String category_name;
  const ProductPage({Key? key, required this.category_name}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref();
  final cartdb = FirebaseDatabase.instance.ref();


  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref(widget.category_name);
    final image_ref = FirebaseDatabase.instance.ref('Images');

    String image_url;
    // DataSnapshot snap3 = await image_ref.get();
    final cart = CartProvider();

    Future<void> getImageUrl() async {
      DataSnapshot snap3 = await image_ref.get();

      String eemage_youareell = snap3.child(widget.category_name).value.toString();


      print("Yahin se print");
      print(eemage_youareell);

      // print(Cart[product]['quantity']);
      // print(Cart[product]['price'] * Cart[product]['quantity']);

      setState(() {
        image_url = eemage_youareell;
      });
    }

    @override
    void initState() {
      getImageUrl();
      super.initState();
    }
    // func();
    // print(url);
    // print('123')
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber.shade300,
      //   title: Text(
      //     widget.category_name,
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
      //       // Navigator.pushReplacementNamed(context, '/screen');
      //     },
      //   ),
      // ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height:safeHeight*0.15,
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
                          widget.category_name,
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
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Image.network(
                      //
                      //     $image_url,
                      //     height:safeHeight*0.25,
                      //     width:safeWidth*0.5,
                      //   ),
                      // )
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
                              Border.all(color: Colors.grey.shade300, width: 3),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Image.network(
                                      height: 100,
                                      width: 100,
                                      snapshot.child('url').value.toString()),
                                ),
                                //     Image(
                                //     height:100,
                                //     width:100,
                                //     image:AssetImage(productImage[index].toString())
                                // ),
                                SizedBox(
                                  height: 10,
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
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
                                        ],
                                      ),

                                      SizedBox(width: 20),
                                      InkWell(
                                        onTap: () async {
                                          Fluttertoast.showToast(
                                            msg: 'Item added to cart',
                                            backgroundColor: Colors.grey,
                                          );
                                          cartdb
                                              .child("Users").child(MyPhone.name).child("cart")
                                              .child(snapshot
                                              .child('productName')
                                              .value
                                              .toString())
                                              .set({
                                            'productName': snapshot
                                                .child('productName')
                                                .value
                                                .toString(),
                                            'initialPrice': snapshot
                                                .child('productPrice')
                                                .value
                                                .toString(),
                                            'productPrice': snapshot
                                                .child('productPrice')
                                                .value
                                                .toString(),
                                            'quantity': 1,

                                            // 'unitTag': productUnit[index].toString(),
                                            'image':
                                            snapshot.child('url').value.toString()
                                          });

                                          DatabaseReference nav = FirebaseDatabase.instance.ref().child("Users").child(MyPhone.name).child("cart");

                                          // Get the data once
                                          DatabaseEvent event = await nav.once();

                                          // Print the data of the snapshot
                                          print(event.snapshot.child('productPrice').value); // { "name": "John" }

                                          // id: index,
                                          // productId: index.toString(),
                                          // productName: productName[index].toString(),
                                          // initialPrice: productPrice[index],
                                          // productPrice: productPrice[index],
                                          // quantity: 1,
                                          // unitTag: productUnit[index].toString(),
                                          // image: productImage[index].toString())
                                        },
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            margin:EdgeInsets.only(right: 5, bottom: 5),
                                            width: 120,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.amber.shade300,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Add to cart',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                ),
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

                        ],
                      ),
                    ),
                    // title:Text(
                    //     snapshot.child('productName').value.toString()
                    // ,),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
