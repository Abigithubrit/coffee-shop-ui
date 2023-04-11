import 'dart:math';

import 'package:coffee/components/coffeetile.dart';
import 'package:coffee/models/coffee.dart';
import 'package:coffee/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  // re,move from cart
  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context,listen: false).removeItemToCart(coffee);
  }
  //pay button tapped
  void paynow(){

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text('Your Cart',style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Expanded(child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index) {
                //get individual cart items
                Coffee eachCoffee = value.userCart[index];
                //return coffee tile
                return CoffeeTile(
                  coffee: eachCoffee, 
                  icon: Icon(Icons.delete), 
                  onpressed: ()=> showDialog(context: context,
                   builder: (context) => AlertDialog(
                    title: Text('Are you sure you wanna delete'),
                    actions: [
                      MaterialButton(onPressed: () => removeFromCart(eachCoffee),
                      child: Text('Yes'),),
                      MaterialButton(onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No'),)
                    ],
                   ),) );

              }, )),
              SizedBox(height: 10,),
              //pay now button
              GestureDetector(
                onTap:paynow ,
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.brown
                  ),
                  child: Text('Pay Now',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                ),
              )
          ],
        ),
      ),
    ),);
  }
}