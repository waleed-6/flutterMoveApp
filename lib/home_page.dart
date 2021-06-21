import 'package:flutter/material.dart';
import 'package:movie/moveScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatelessWidget {
  final String url = 'https://api.themoviedb.org/3/search/movie?api_key=3a7e12a9b85f1b519fe98f7b8eb42721&query=';
  var _controller = TextEditingController();

  Future getsearch(String searchQuery) async {
    http.Response response = await http.get(Uri.https('api.themoviedb.org',
        '/3/search/movie&api_key=3a7e12a9b85f1b519fe98f7b8eb42721&query=$searchQuery&page=1'));
    print(response.statusCode);

    var jsonResponse =
    convert.jsonDecode(response.body);
    var itemCount = jsonResponse['poster_path'];
    print(itemCount);

  }

  @override
  Widget build(BuildContext context) {
    double scall = MediaQuery
        .of(context)
        .devicePixelRatio;
    return Scaffold(
        body: SafeArea(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white)
                  ),
                  labelText: 'Search here for movie or TV show',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed:() {
                      getsearch(_controller.text);

                    },

                  ),
                ),
                style: TextStyle(
                    color: Colors.white
                ),


              ),

              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,

                    children: [

                      Expanded(child: movie('forrest.jpg', 'forrestGamp')),
                 Expanded(child: movie('1917.jpg', '1917')),

                  Expanded(child: movie('avenger.jpg', 'avenger')),
                  Expanded(child: movie('fight.jpg', 'fight club')),

                  Expanded(child: movie('seven.jpg', 'seven')),
                  Expanded(child: movie('INCEPTION.jpg', 'Inception')),

                  Expanded(child: movie('Interstellar.jpg', 'interstellar')),
                  Expanded(child: movie('scent.jpg', 'scent of a woman'))
        ]),
              ),
            ],
          ),)
    );
  }
}

class movie extends StatelessWidget {
  movie(this.ImageName, this.movieName);

  String ImageName;
  String movieName;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black,
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            moveScreen(ImageName, movieName)));
              },
              child: Hero(
                tag: movieName,
                child: AspectRatio(
                  aspectRatio: 4/3.3,
                  child: Image(
                    image: AssetImage('images/$ImageName'),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Text(
            movieName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
