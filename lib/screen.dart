// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart/cart_screen.dart';
// import inkwell
import 'package:smart/cart_model.dart';
import 'package:smart/new_cart_screen.dart';
import 'package:smart/product_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart/phone.dart';
import 'package:smart/user.dart';
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

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            height:20,
            color:Colors.amber.shade200,
          ),

          Container(

            height:0.11*safeHeight,
            width:safeWidth,
            decoration: BoxDecoration(
                color: Colors.amber[200],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )
            ),


            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Icon(
                  Icons.store_mall_directory,
                  size:48,
                  color:Colors.black,
                ),
                Text(
                  'SMart',
                  style:TextStyle(
                    fontFamily:'Gloock-Regular',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),


                ),
                Spacer(),

                //
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [

                      GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/user', (route) => false);
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/userrrrrr.png'),
                            ),
                          ),

                //     ],
                //
                // ),
                // Container(
                //   padding:EdgeInsets.fromLTRB(180, 0, 0, 0),
                //   child:GestureDetector(
                //     onTap: () {
                //       Navigator.pushNamedAndRemoveUntil(context, '/user', (route) => false);
                //     },
                //     child: CircleAvatar(
                //       radius: 30,
                //       backgroundImage: AssetImage('assets/userrrrrr.png'),
                //     ),
                //   ),
                // ),

              ],

            ),

          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 10.0),
                  child: Text(
                    'Hello,${MyPhone.name}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0.0, 0, 5.0),
                      child: Row(
                        children: [
                          Text(
                            'Welcome to ',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Gloock-Regular',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'SMart ',
                            style: TextStyle(
                              fontSize:25,
                              fontFamily: 'Gloock-Regular',
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      Container(
        width:safeWidth*0.93,
        height:safeHeight*0.05625,


        decoration: BoxDecoration(
            // border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          color:Colors.grey.shade300,
        ),

        // Icon(Icons.search),


        child:TextFormField(

          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            hintText: "Search",

          ),
        ),

      ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Gloock-Regular',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


              ],
            ),
          ),


          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:safeWidth*0.3,
                    height:safeHeight*0.18,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(category_name: 'chips')));
                      },

                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[100],

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/chips.png',
                            height:safeHeight*0.1,
                            width: safeWidth*0.2,
                          ),


                          Container(
                            height:safeHeight*0.037,
                            width:safeWidth*0.247,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                              color: Colors.white,
                            ),


                            child:Center(
                              child: Text(
                                'Chips',
                                style: TextStyle(
                                  color:Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gloock-Regular',
                                ),

                              ),
                            ),
                          ),
                          // Image.asset('assets/chips_text.png'),
                        ],

                      ),

                      //   ],
                      // ),
                    ),
                  ),
                  Container(
                    width:safeWidth*0.3,
                    height:safeHeight*0.18,
                    child: ElevatedButton(
                      onPressed: () {
                        // var String = 'biscuits';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(category_name: 'biscuits')));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/biscuits.png',
                            height:safeHeight*0.1,
                            width: safeWidth*0.2,
                          ),
                          Container(
                            height:safeHeight*0.037,
                            width:safeWidth*0.247,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                              color: Colors.white,
                            ),
                            child:Center(
                              child: Text(
                                'Biscuits',
                                style: TextStyle(
                                  color:Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gloock-Regular',
                                ),

                              ),
                            ),
                          ),
                          // Image.asset(
                          //   'assets/biscuit_text.png',
                          //   width: 120,
                          // ),
                        ],
                      ),

                      //   ],
                      // ),
                    ),
                  ),
                  Container(
                    width:safeWidth*0.3,
                    height:safeHeight*0.18,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(category_name: 'pastries')));

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/pastry_2.png',
                            height:safeHeight*0.1,
                            width: safeWidth*0.2,
                          ),
                          Container(
                            height:safeHeight*0.037,
                            width:safeWidth*0.247,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                              color: Colors.white,
                            ),
                            child:Center(
                              child: Text(
                                '  Pastries  ',
                                style: TextStyle(
                                  color:Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gloock-Regular',
                                ),

                              ),
                            ),
                          ),
                          // Image.asset(
                          //   'assets/pastry_text.png',
                          //   width: 120,
                          // ),
                        ],
                      ),

                      //   ],
                      // ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
                width: 500,

              ),


          // Container(
          //   height: 10,
          //   width: 500,
          //   color: Colors.white,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width:safeWidth*0.3,
                height:safeHeight*0.18,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(category_name: 'spices')));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0.1, vertical: 12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/spices.png',
                        height:safeHeight*0.1,
                        width: safeWidth*0.2,
                      ),
                      Container(
                        height:safeHeight*0.037,
                        width:safeWidth*0.247,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                          color: Colors.white,
                        ),
                        child:Center(
                          child: Text(
                            'Spices',
                            style: TextStyle(
                              color:Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gloock-Regular',
                            ),

                          ),
                        ),
                      ),
                      // Image.asset('assets/spicess_text2.png'),
                    ],
                  ),

                  //   ],
                  // ),
                ),
              ),
              Container(
                width:safeWidth*0.3,
                height:safeHeight*0.18,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(category_name: 'chocolates')));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/chocolates.png',
                        height:safeHeight*0.1,
                        width: safeWidth*0.2,
                      ),
                      Container(
                        height:safeHeight*0.037,
                        width:safeWidth*0.247,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                          color: Colors.white,
                        ),
                        child:Center(
                          child: Text(
                            'Chocolates',
                            style: TextStyle(
                              color:Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gloock-Regular',
                            ),

                          ),
                        ),
                      ),
                      // Image.asset(
                      //   'assets/choco_text.png',
                      //   width: 120,
                      // ),
                    ],
                  ),

                  //   ],
                  // ),
                ),
              ),
              Container(
                width:safeWidth*0.3,
                height:safeHeight*0.18,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(category_name: 'beverages')));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/beve.png',
                        height:safeHeight*0.1,
                        width: safeWidth*0.2,
                      ),
                      Container(
                        height:safeHeight*0.037,
                        width:safeWidth*0.247,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                          color: Colors.white,
                        ),
                        child:Center(
                          child: Text(
                            ' Beverages ',
                            style: TextStyle(
                              color:Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gloock-Regular',
                            ),

                          ),
                        ),
                      ),
                      // Image.asset(
                      //   'assets/bev_text.png',
                      //   width: 120,
                      // ),
                    ],
                  ),

                  //   ],
                  // ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
            width: 500,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width:safeWidth*0.3,
                height:safeHeight*0.18,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(category_name: 'cakes')));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0.1, vertical: 12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/cake.png',
                        height:safeHeight*0.1,
                        width: safeWidth*0.2,
                      ),
                      Container(
                        height:safeHeight*0.037,
                        width:safeWidth*0.247,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                          color: Colors.white,
                        ),
                        child:Center(
                          child: Text(
                            'Cakes',
                            style: TextStyle(
                              color:Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gloock-Regular',
                            ),

                          ),
                        ),
                      ),
                      // Image.asset('assets/cake_text1.png'),
                    ],
                  ),

                  //   ],
                  // ),
                ),
              ),
              Container(
                width:safeWidth*0.3,
                height:safeHeight*0.18,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(category_name: 'cannedgoods')));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/cannedgoods.png',
                        height:safeHeight*0.1,
                        width: safeWidth*0.2,
                      ),
                      Container(
                        height:safeHeight*0.04,
                        width:safeWidth*0.247,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                          color: Colors.white,
                        ),
                        child:Center(
                          child: Text(
                            'Canned\ngoods',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color:Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gloock-Regular',
                            ),

                          ),
                        ),
                      ),
                      // Image.asset(
                      //   'assets/cannedgoodstext.png',
                      //   width: 120,
                      // ),
                    ],
                  ),

                  //   ],
                  // ),
                ),
              ),
              Container(
                width:safeWidth*0.3,
                height:safeHeight*0.18,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductPage(category_name: 'personalcare')));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/personalcare.png',
                        height:safeHeight*0.1,
                        width: safeWidth*0.2,
                      ),
                      Container(
                        height:safeHeight*0.037,
                        width:safeWidth*0.247,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
                          color: Colors.white,
                        ),
                        child:Center(
                          child: Text(
                            'Personal\nCare',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gloock-Regular',
                            ),

                          ),
                        ),
                      ),
                      // Image.asset(
                      //   'assets/personal_text.png',
                      //   width: 120,
                      // ),
                    ],
                  ),

                  //   ],
                  // ),
                ),
              ),
            ],
          ),
          ],
          ),
          Spacer(),

          Container(
            color: Colors.amber[200],
            width: double.infinity,
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen2()),
                );
              },
            ),

            // child:FloatingActionButton.extended(
            //   onPressed: (){
            //     Navigator.pushReplacementNamed(context, '/OTP');
            //   },
            //   label: const Text (
            //     "x Items",
            //     style:TextStyle(
            //       fontFamily:'Gloock-Regular',
            //
            //       fontSize: 15,
            //       color:Colors.black87,
            //     ),
            //   ),
            //   backgroundColor: Colors.amber[200],
            //   elevation: 0.0,
            //   shape: BeveledRectangleBorder(
            //     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            //   ),
            // ),
          ),

          // Container(
          //   height:60,
          //   width:500,
          //   color:Colors.red[50],
          //   child:Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children:[
          //       Icon(
          //         Icons.receipt,
          //
          //       ),
          //       Icon(
          //         Icons.home,
          //       ),
          //       Icon(
          //         Icons.shopping_cart,
          //       ),
          //
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

