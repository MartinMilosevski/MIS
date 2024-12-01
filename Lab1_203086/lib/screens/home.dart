import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab1_203086/models/ClothesList.dart';
import 'package:lab1_203086/models/clothes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Clothes> clothes = [
    Clothes(
      name: "Real Madrid Shorts",
      picture: "https://www.houseoffraser.co.uk/images/imgzoom/37/37645418_xxl_a6.jpg",
      price: 20,
      description: "Real Madrid black shorts"
    ),
    Clothes(
      name: "trousers",
      picture: "https://www.piniparma.com/cdn/shop/products/stonetrousers_6.jpg?v=1646670435&width=1000",
      price: 30,
      description: "trousers made in italy",
    ),
    Clothes(
      name: "Man Utd Jersey",
      picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI_I0HOFrIFMTyU7xIz2JjjC4LrWVlmDaM7A&s",
      price: 50,
      description: "manchester united fotball jersey"
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 24)),
        title:const Text('Clotes Store'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          return Container(
          child: Clotheslist(item: clothes[index]));
        },
      ),
    );
  }
}

