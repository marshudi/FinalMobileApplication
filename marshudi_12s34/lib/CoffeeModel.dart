class Coffee{
  String image,coffeeID,coffeeName,quantity,price,description,ratings;
  Coffee(this.image,this.coffeeID,this.coffeeName,this.quantity,this.price,this.description,this.ratings);

  Map<String,dynamic> toJson()=>{
    "image":image,  //input
    "coffeeID":coffeeID, //input
    "coffeeName":coffeeName, //input
    "quantity":quantity, //input
    "price":price, //input
    "description":description, //input
    "ratings":ratings,  // constant = 0.0




  };

}