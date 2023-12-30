import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marshudi_12s34/OrderPage.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DatabaseReference mydb = FirebaseDatabase.instance.ref("Coffee");

  Query myQuery = FirebaseDatabase.instance.ref("Coffee");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          height:750 ,
          child: FirebaseAnimatedList(
            scrollDirection: Axis.vertical,
              query: myQuery,
              itemBuilder:(context, snapshot,
                  animation, index) {
                Map product=snapshot.value as Map; //to get all details except the key

                product["key"]=snapshot.key;  // to get the key

                return myDesignList(product:product);
              }, ),
        ),
      ),
    );
  }
  Widget myDesignList({required Map product}){
    return Card(
        
      child: Row(
        
        children: [
          
          GestureDetector(onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage(
              coffeeId:product["coffeeID"],
              coffeeName:product["coffeeName"],
              coffeeDescription:product["description"],
              coffeeImage:product["image"],
              coffeePrice:product["price"],
              coffeeQuantity:product["quantity"],
              coffeeRating:product["ratings"],
              coffeeKey:product["key"],
            )));


          },
            child: Image.network("${product["image"]}",width: 100,height: 60,)),

          Column(
            children: [
                Text("Coffee Name: ${product["coffeeName"]}"),
                Text("Price: ${product["price"]} OMR"),
            ],
          ),

        ],

        
        
      ),
      
    );
  }
}
