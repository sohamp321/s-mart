import 'dart:ui';
import 'package:smart/new_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:smart/cart_screen.dart';
// import inkwell
import 'package:smart/cart_model.dart';
import 'package:smart/new_cart_screen.dart';
import 'package:smart/product_page.dart';
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
class Payment extends StatefulWidget {
  final int total_price;
  const Payment({Key? key, required this.total_price}) : super(key: key);


  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var _razorpay = Razorpay();
  var amountController = TextEditingController();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Done");
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        title: Text(
            "Payment Window",
          style:TextStyle(
            fontFamily:'Gloock-Regular',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,

          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height:safeHeight*0.1),
            Container(
              width:safeWidth*0.8,
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
                  prefixIcon: Icon(Icons.location_on_outlined),
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: "Location",

                ),
              ),

            ),
            Image.asset(
                'assets/cod-removebg-preview.png',
              height:safeHeight*0.3,
              width:safeWidth*0.6,
            ),
            SizedBox(
              height:safeHeight*0.0747198,
              width:safeWidth*0.824175,
              child: ElevatedButton(
                onPressed:(){ Navigator.pushReplacementNamed(context, '/thanks');}
                , child:Text(
                'Cash on delivery',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color:Colors.black,
                  fontFamily: 'Montserrat-Bold',
                ),
              ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber.shade200,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                  ),

                ),
              ),
            ),
            Image.asset('assets/pay_now-removebg-preview.png',
              height:safeHeight*0.3,
              width:safeWidth*0.6,
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //   // child: TextField(
            //   //   controller: amountController,
            //   //   decoration:
            //   //   const InputDecoration(hintText: "Enter your Amount"),
            //   // ),
            // ),
            SizedBox(
              height:safeHeight*0.0747198,
              width:safeWidth*0.824175,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber.shade200,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Set the desired circular radius here
                    ),

                  ),
                  child: Text(
                      "Pay Amount",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                      fontFamily: 'Montserrat-Bold',
                    ),
                  ),
                  onPressed: () {
                    ///Make payment
                    var options = {
                      'key': "rzp_test_6IAzTRs8ZyFNaj",
                      // amount will be multiple of 100
                      // 'amount': (int.parse(amountController.text) * 100)
                      //     .toString(),
                      'amount': (widget.total_price*100)
                          .toString(),//So its pay 500
                      'name': 'Jiya',
                      'description': 'Demo',
                      'timeout': 300, // in seconds
                      'prefill': {
                        'contact': '8787878787',
                        'email': 'codewithpatel@gmail.com'
                      }
                    };
                    _razorpay.open(options);
                  }),
            )
          ],
        ),
      ),

    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
