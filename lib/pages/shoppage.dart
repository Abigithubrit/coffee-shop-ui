import 'package:coffee/components/coffeetile.dart';
import 'package:coffee/models/coffee.dart';
import 'package:coffee/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  //add coffee to the cart
  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen: false).addItemToCart(coffee);
    //let the user know its done
    showDialog(context: context,
     builder: (context) => AlertDialog(
      title: Text('Successfully Added'),
      actions: [
        MaterialButton(onPressed:() {
          Navigator.pop(context);
        }, child: Text('Close'),)
      ],
     ),);

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) =>  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text('How would tou like your coffee?',
              style: TextStyle(fontSize: 20),),
              SizedBox(height: 25,),
              // list of coffee to buy
              Expanded(child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
                  //get individual coffee
                  Coffee eachCoffee = value.coffeeShop[index];
    
                  //return the tiile for this coffee
                  return CoffeeTile(
                    coffee: eachCoffee, 
                    icon: Icon(Icons.add),
                    onpressed:() =>  addToCart(eachCoffee));
                },))
            ],
          ),
        ),
      ),
    );
  }
}