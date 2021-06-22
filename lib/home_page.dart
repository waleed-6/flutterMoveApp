import 'package:flutter/material.dart';
import 'package:movie/moveScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<movie> screenMovies=[];
  var _controller = TextEditingController();
  var picPath;
  var moveName;
  var story;

  @override
  void initState() {
    super.initState();
    setState(() {
      trend();
    });

    print(screenMovies.length);
  }
  Future<List<movie>> trend() async{
    http.Response response = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/movie/day?api_key=5e2cda9626e1b5ce284c5ad6dd1cedc9'));
    var jsonResponse =
    convert.jsonDecode(response.body);
    getdata(jsonResponse);
  }

  Future getsearch(String searchQuery) async {
    http.Response response = await http.get(Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=5e2cda9626e1b5ce284c5ad6dd1cedc9&query=$searchQuery'));
    var jsonResponse =
    convert.jsonDecode(response.body);
    getdata(jsonResponse);

  }

  List<movie> getdata(var json){

    if(!screenMovies.isEmpty){
    screenMovies.clear();
    }
    for(int i=0;i<json['results'].length-1;i++){
      screenMovies.add(movie(json['results'][i]['poster_path'],json['results'][i]['title'],json['results'][i]['overview']));
    }
    print(screenMovies.length);
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
                      setState(() {
                        getsearch(_controller.text);
                      });


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
                    children:screenMovies ),
              ),
            ],
          ),)
    );
  }
}


class movie extends StatelessWidget {
  movie(this.ImageName, this.movieName,this.story);

  String ImageName;
  String movieName;
  String story;

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
                            moveScreen(movieName, ImageName,story)));
              },
              child: Hero(
                tag: movieName,
                child: AspectRatio(
                  aspectRatio: 4/3.3,
                  child: Image(
                    image: NetworkImage('https://image.tmdb.org/t/p/w500$ImageName'),
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


