import 'package:coffee/components/bottomnavbar.dart';
import 'package:coffee/const.dart';
import 'package:coffee/pages/cartpage.dart';
import 'package:coffee/pages/shoppage.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigate the bottom bar
  int selected = 0;
  void navigatebottombar(int index){
    setState(() {
      selected = index;
    });
  }
  //pages
  final List pages=[
    //Shoppage
Shoppage(),
    //cartpage
    Cartpage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: pages[selected],
      bottomNavigationBar: MYBottomNavBar(
        onTabChange: (index) => navigatebottombar(index),),
    );
  }
}