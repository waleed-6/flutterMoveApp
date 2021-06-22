import 'package:flutter/material.dart';
import 'package:super_hero/super_hero.dart';


class moveScreen extends StatelessWidget {
 moveScreen(this.moveName,this.picpth,this.overview);
 String moveName;
 String picpth;
 String overview;

  @override
  Widget build(BuildContext context) {
    double scall=MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    String superHero=SuperHero.random();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: moveName,
              child: Container(
                child: Image(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500$picpth'),
                height: height/2,
                width: width,
                fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 5*scall,
            ),
            Text(
              moveName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20*scall,
            ),

            Text(overview,
                style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                ),

         ),
          ],
        ),
      )
    );
  }
}
