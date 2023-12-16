import 'package:flutter/material.dart';
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

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:<Widget> [
          Container(
            child: Image.asset(
                'assets/abcdef.png',
              height:0.6924*safeHeight,
              width:safeWidth,
            ),
          ),
          Container(
            padding:EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 20.0),
            child:Text(
              'Get Your Favourite \n Items, Delivered Right \n To Your Doorstep',
              textAlign: TextAlign.center,
              style:TextStyle(
                fontFamily:'Gloock-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),



            ),

          ),
          SizedBox(
            height:safeHeight*0.0747198,
            width:safeWidth*0.824175,
            child: ElevatedButton(
                onPressed:(){ Navigator.pushReplacementNamed(context, '/phone');}
                , child:Text(
              'Get Started',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color:Colors.black,
                fontFamily: 'Montserrat-Bold',
              ),
            ),
    style: ElevatedButton.styleFrom(
    primary: Colors.amber.shade400,

    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
    ),

            ),
            ),
          ),


        ],
      ),



    );
  }
}