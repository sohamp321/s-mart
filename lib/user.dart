import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart/phone.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);
  @override
  State<User> createState() => _UserState();
}
class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height:250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Set the desired radius here
              color: Colors.lightGreen.shade200,
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black87,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/screen', (route) => false);
                    // Navigator.pushReplacementNamed(context, '/screen');
                  },
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/hello.png',
                      height:150,
                      width:200,
                    ),

                    Image.asset(
                      'assets/user-removebg-preview.png',
                      height:150,

                    ),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(height:20),
          Text(
            '   Name',
            style:TextStyle(
              fontFamily:'Gloock-Regular',
              fontSize: 25,
              fontWeight: FontWeight.bold,
                  ),
                ),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(width:20),
              Container(
                height:40,
                width:320,
                color: Colors.grey.shade200,
                child:Text(  MyPhone.name,
                  style:TextStyle(
                  fontFamily:'Gloock-Regular',
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                   color: Colors.black87 ,
                                      ),

                ),
              ),
            ],
          ),


          SizedBox(height:20),
          Text(
            '   Location',
            style:TextStyle(
              fontFamily:'Gloock-Regular',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(width:20),
              Container(
                height:40,
                width:320,
                color: Colors.grey.shade200,
                child:Text(  MyPhone.location,
                  style:TextStyle(
                    fontFamily:'Gloock-Regular',
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87 ,
                  ),

                ),
              ),
            ],
          ),



          SizedBox(height:20),
          Text(
            '   Phone Number',
            style:TextStyle(
              fontFamily:'Gloock-Regular',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87
            ),
          ),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(width:20),
              Container(
                height:40,
                width:320,
                color: Colors.grey.shade200,
                child:Text(  MyPhone.number,
                  style:TextStyle(
                    fontFamily:'Gloock-Regular',
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87 ,
                  ),

                ),
              ),
            ],
          ),

      ],
      ),



      //
      //           Container(
      //             color: Colors.white60,
      //             height:60,
      //             width:350,
      //             child:Row(
      //               children: <Widget>[
      //                 Text(
      //                   'Name : ',
      //                   style:TextStyle(
      //                     fontFamily:'Gloock-Regular',
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.w300,
      //                   ),
      //                 ),
      //                 Text(
      //                   MyPhone.name,
      //                   style:TextStyle(
      //                     fontFamily:'Gloock-Regular',
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height:10,
      //           ),
      //           Container(
      //             color: Colors.white60,
      //             height:60,
      //             width:350,
      //             child:Row(
      //               children: <Widget>[
      //                 Text(
      //                   'Location : ',
      //                   style:TextStyle(
      //                     fontFamily:'Gloock-Regular',
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.w300,
      //                   ),
      //                 ),
      //                 Text(
      //                   MyPhone.location,
      //                   style:TextStyle(
      //                     fontFamily:'Gloock-Regular',
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height:10,
      //           ),
      //           Container(
      //             color: Colors.white60,
      //             height:60,
      //             width:350,
      //             child:Row(
      //               children: <Widget>[
      //                 Text(
      //                   'Number: ',
      //                   style:TextStyle(
      //                     fontFamily:'Gloock-Regular',
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.w300,
      //                   ),
      //                 ),
      //                 Text(
      //                   MyPhone.number,
      //                   style:TextStyle(
      //                     fontFamily:'Gloock-Regular',
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //
      //         ],
      //       ),
      //     ),
      //   ],
      // ),


    );
  }
}
