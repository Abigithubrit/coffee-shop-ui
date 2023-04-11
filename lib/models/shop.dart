import 'package:coffee/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{
  //coffee for sale
  final List<Coffee> shop = [
    //black coffee

    Coffee(
      name: 'Long Black',
      price: '200', 
      imagePath: 'images/a.png'),
      Coffee(
      name: 'Long Black',
      price: '200', 
      imagePath: 'images/d.png'),
      Coffee(
      name: 'Long Black',
      price: '200', 
      imagePath: 'images/c.png'),
      Coffee(
      name: 'Long Black',
      price: '200', 
      imagePath: 'images/b.png'),
  ];

  //usercart
List<Coffee> _usercart = [];

  //get coffee list
  List<Coffee> get coffeeShop => shop;
  //get usercart
  List <Coffee> get userCart => _usercart;

  //add
  void addItemToCart(Coffee coffee){
    _usercart.add(coffee);
    notifyListeners();
  }


//remove
void removeItemToCart(Coffee coffee){
    _usercart.remove(coffee);
    notifyListeners();
  }
}