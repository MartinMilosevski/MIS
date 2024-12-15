import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2_203086/models/Joke.dart';
import 'package:lab2_203086/services/api_service.dart';

class RandomJoke extends StatefulWidget{

  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJoke();

}

class _RandomJoke extends State<RandomJoke>{

  Joke joke=Joke(id: 0, type: '', setup: '', punchline: '');

  @override
  void initState() {
    super.initState();
    getRandomJokeFromAPI();
  }


  void getRandomJokeFromAPI(){
    ApiService.getRandomJoke().then((response){
      setState(() {
          joke= Joke(id: response['id'], type: response['type'], setup: response['setup'],
              punchline: response['punchline']);
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joke Types"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                color: Colors.amber,
                child: ListTile(
                  title:Text(joke.setup),
                  subtitle: Text(joke.punchline),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}