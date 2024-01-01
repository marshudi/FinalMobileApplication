import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marshudi_12s34/BottomNav.dart';
import 'package:marshudi_12s34/Home.dart';
import 'package:marshudi_12s34/LocalNoti.dart';
import 'package:marshudi_12s34/LocalNotification.dart';

class OrderPage extends StatefulWidget {

  final String coffeeId,coffeeName,coffeeDescription,coffeeImage,coffeePrice,coffeeQuantity,coffeeRating,coffeeKey;
  const OrderPage({super.key,
  required this.coffeeId,
  required this.coffeeName,
  required this.coffeeDescription,
  required this.coffeeImage,
  required this.coffeePrice,
  required this.coffeeQuantity,
  required this.coffeeRating,
  required this.coffeeKey,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  DatabaseReference mydb = FirebaseDatabase.instance.ref("Coffee");
  DatabaseReference mydbOrder = FirebaseDatabase.instance.ref("Order");
  double currentRate=0.0;
  
  String rateDesc="";

  double reqQuan=0.0;

  double totalPrice=0.0;

  int newQuan=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order")),
      body: ListView(
        children: [

          Image.network("${widget.coffeeImage}",width: 400,height: 350,),

          Text("Coffee ID:  ${widget.coffeeId}"),
          Text("Coffee Name:  ${widget.coffeeName}"),
          Text("Coffee Quantity:  ${widget.coffeeQuantity}"),
          Text("Coffee Price:  ${widget.coffeePrice} OMR"),
          Text("Coffee Description:  ${widget.coffeeDescription}"),
          Text("Coffee Key:  ${widget.coffeeKey}"),


          RatingBar.builder(
              initialRating: double.parse(widget.coffeeRating),
              minRating: 0.5,
              allowHalfRating: true,
              itemCount: 5,
              direction: Axis.horizontal,
              unratedColor: Colors.black12,
              
              itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber,),
              onRatingUpdate: (value){
                currentRate=value;
                setState(() {
                  if(value>4){
                    rateDesc="Excellent";
                  }
                  else if(value>2.5){
                    rateDesc="Good";
                  }
                  else if(value>1.5){
                    rateDesc="Average";
                  }
                  else{
                    rateDesc="Bad";
                  }
                });

              }),
          
          Text("Rating Description: ${rateDesc}"),
          
          Slider(
              value: reqQuan,
              min: 0,
              max:double.parse(widget.coffeeQuantity),
              onChanged: (value){
                setState(() {
                  reqQuan=value;
                });
              }),
          
          Text("Desired Quantity: ${reqQuan.toInt()}"),

          ElevatedButton(onPressed: (){

            totalPrice=double.parse(widget.coffeePrice)*reqQuan.toInt();
            newQuan=int.parse(widget.coffeeQuantity)-reqQuan.toInt();

            //show alert dialog to confirm order/purchase
            showDialog(context: context,
              builder: (BuildContext context){
                return  AlertDialog(
                      title: Text("Confirm Order"),
                      content: Text("you are buying ${widget.coffeeName}\n "
                          "Total price $totalPrice OMR \n"
                          "Are you sure you want to buy this product!"),

                  actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);

                          //to update ratings and product quantity
                          mydb.child(widget.coffeeKey).update({
                            "ratings":currentRate.toString(),
                            "quantity":newQuan.toString()
                          });

                          //to add buyers details into a new table called "Order"

                          mydbOrder.push().set({
                            "id":"Student ID",
                            "name":"Student Name",
                            "quantity":"${reqQuan.toInt()}",
                            "totalPrice":"${totalPrice}"
                          });
                        }, child: Text("Confirm")),
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Cancel")),
                      ],
                    );

              }

            );

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Total Price: ${totalPrice}")));
            
          }, child: Text("Buy")),
          
          Text("Total Price: ${totalPrice} OMR"),
          
          ElevatedButton(onPressed: (){


            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));

            mydb.child(widget.coffeeKey).remove();


            LocalNoti.startNoti();

            LocalNoti.showNoti(id: int.parse(widget.coffeeId), title: "${widget.coffeeName}", body: "Deleted Successfully");


          }, child: Text("Deleted")),
          
          Image.asset("lib/asset/logo.png")
          
        ],
      ),
    );
  }

 // void alertDialog()
  
}
