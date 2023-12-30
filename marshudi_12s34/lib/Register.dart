import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marshudi_12s34/CoffeeModel.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController image = TextEditingController();
  TextEditingController coffeeID = TextEditingController();
  TextEditingController coffeeName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();


  DatabaseReference mydb = FirebaseDatabase.instance.ref("Coffee");

  final _formkey = GlobalKey<FormState>();

  double rates=0.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
        children: [

          TextFormField(
            controller: image,
            decoration: InputDecoration(label: Text("Enter Image")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please Enter the Image URL";
              }
            },
          ), TextFormField(
            controller: coffeeID,
            decoration: InputDecoration(label: Text("Enter Coffee ID")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please Enter the Coffee ID";
              }
            },
          ), TextFormField(
            controller: coffeeName,
            decoration: InputDecoration(label: Text("Enter coffee Name")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please Enter the coffee Name";
              }
            },
          ), TextFormField(
            controller: quantity,
            decoration: InputDecoration(label: Text("Enter quantity")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please Enter the quantity";
              }
            },
          ), TextFormField(
            controller: price,
            decoration: InputDecoration(label: Text("Enter price")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please Enter the price";
              }
            },
          ), TextFormField(
            controller: description,
            decoration: InputDecoration(label: Text("Enter description")),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please Enter the description";
              }
            },
          ),


          ElevatedButton(onPressed: () {

            if(_formkey.currentState!.validate()){

              Coffee newCoffee = Coffee(
                  image.text,
                  coffeeID.text,
                  coffeeName.text,
                  quantity.text,
                  price.text,
                  description.text,
                  rates.toString());

              mydb.push().set(newCoffee.toJson());


              print("###################");
              print("Sumbitted");
              print("###################");

            }

            else{
              print("###################");
              print("Failed");
              print("###################");

            }


          }, child: Text("Register"))


        ],
      ),

    );
  }
}
