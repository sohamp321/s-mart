import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Fetch extends StatefulWidget {
  const Fetch({Key? key}) : super(key: key);

  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {

  final auth=FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.ref('chips');
//   final refs = FirebaseStorage.instance.ref().child('images/imm.png');
// // no need of the file extension, the name will do fine.
//   var url='';
//   void func()async{
//     url = await refs.getDownloadURL();
//     print(url);
//     print('1');
//   }

  // Reference referenceRoot=FirebaseStorage.instance.ref();
  // Reference referenceDirImages =referenceRoot.child('images');



  @override
  Widget build(BuildContext context) {
    // func();
    // print(url);
    // print('123');
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
          title: Text('Chips',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Gloock-Regular',
                color:Colors.black87,
              ),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black87,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/screen', (route) => false);
            // Navigator.pushReplacementNamed(context, '/screen');
          },
        ),
      ),
      body:Container(
        height:double.infinity,
        child:Expanded(
          child: FirebaseAnimatedList(
              query:ref,
              itemBuilder: (context,snapshot,animation,index){
                return ListTile(
                  title:Column(
                children: [

                Row(
                children: [
                  Image.network(
                      height: 100,
                      width:100,
                      snapshot.child('url').value.toString()),
                //     Image(
                //     height:100,
                //     width:100,
                //     image:AssetImage(productImage[index].toString())
                // ),
                Expanded(child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                Text(snapshot.child('productName').value.toString(),
                // Text(chip['productName'].tostring(),
                style:TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 15,
                ),
                ),
                Text('Rs. '+ snapshot.child('productPrice').value.toString(),
                style:TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 15,
                ),
                ),
                SizedBox(width:20),
                Align(
                alignment: Alignment.centerRight,
                child:Container(
                width:120,
                height:40,
                decoration: BoxDecoration(
                color:Colors.amber.shade300,
                borderRadius: BorderRadius.circular(10),
                ),
                child:Center(
                child:Text('Add to cart',
                style:TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                ),),
                ),



                ),
                ),
                ],



                ),
                )
                ],
                ),
                ],
                ),
                  // title:Text(
                  //     snapshot.child('productName').value.toString()
                  // ,),
                );

              },),
        )

      ),
    );
  }
}

