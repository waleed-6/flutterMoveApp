import 'package:flutter/material.dart';
import 'package:super_hero/super_hero.dart';


class moveScreen extends StatelessWidget {
 moveScreen(this.movepic,this.moveName);
 String movepic;
 String moveName;


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
                child: Image(image:AssetImage('images/$movepic'),
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

            Text(
            'there should be text here to Explain the story of movie',

                style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                ),

         ),
            SizedBox(
              height: 20*scall,
            ),
            Text(superHero,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),

            )
          ],
        ),
      )
    );
  }
}
