import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab2_203086/models/Joke.dart';
import 'package:lab2_203086/models/JokeType.dart';
import 'package:lab2_203086/screens/JokesOfTypeList.dart';
import 'package:lab2_203086/screens/RandomJoke.dart';
import '../services/api_service.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<JokeType> types_of_jokes = [];

  @override
  void initState() {
    super.initState();
    getJokesTypesFromAPI();
  }

  void getJokesTypesFromAPI() async {
    ApiService.getJokesTypes().then((response) {
      var data = List.from(json.decode(response.body));
      setState(() {
        types_of_jokes =data.map<JokeType>((item) {
          return JokeType(name:item);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joke Types"),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RandomJoke()));
            },
            icon: const Icon(Icons.account_box, color: Colors.black, size: 24)
        ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: types_of_jokes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Jokesoftypelist(jokeType: types_of_jokes[index].name),
                  ),
                );
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.amber,
                child: Center(
                  child: Text('${types_of_jokes[index].name}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


