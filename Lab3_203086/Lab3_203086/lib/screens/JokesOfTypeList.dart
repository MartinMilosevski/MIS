

import 'package:flutter/material.dart';
import 'package:lab2_203086/models/Joke.dart';
import 'package:lab2_203086/services/api_service.dart';


class Jokesoftypelist extends StatefulWidget {
  final String jokeType;
  final List<Joke> favoritesjokes;

  const Jokesoftypelist({super.key, required this.jokeType,
  required this.favoritesjokes});

  @override
  State<Jokesoftypelist> createState() => _Jokesoftypelist();
}

class _Jokesoftypelist extends State<Jokesoftypelist> {
  List<Joke> jokes = [];


  @override
  void initState() {
    super.initState();
    getJokes(widget.jokeType);
  }

  void getJokes(String type) async {
    ApiService.getJokesForType(type).then((response) {
      setState(() {
        jokes = response.map<Joke>((item) {
          print("$item[setup]");
          return Joke(id: item['id'], type: type, setup: item['setup'], punchline: item['punchline']);
        }).toList();
      });
    }).catchError((e){
      print("Error fatching $e");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                color: Colors.amber,
                child: ListTile(
                  title:Text(jokes[index].setup),
                  subtitle: Text(jokes[index].punchline),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite,color: Colors.red,),
                    onPressed: () {
                      setState(() {
                        widget.favoritesjokes.add(jokes[index]);
                      });
                    },
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
