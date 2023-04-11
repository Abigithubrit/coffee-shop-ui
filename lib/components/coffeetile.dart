import 'package:coffee/models/coffee.dart';
import 'package:flutter/material.dart';
class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onpressed;
  final Widget icon;
 CoffeeTile({super.key,required this.coffee,
 required this.icon,
  required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(onPressed: onpressed
          
        , icon: icon),
      ),
    );
  }
}