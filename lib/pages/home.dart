import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Image> images = List<Image>();
  Color colorName;

  @override
  void initState() {
    super.initState();
    colorName = Color.fromRGBO(59,124,116, 0.4);
    images.add(Image(image: AssetImage("images/home2.jpg")));
    images.add(Image(image: AssetImage("images/home3.jpg")));
    images.add(Image(image: AssetImage("images/home4.jpg")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: CarouselSlider(              
                          height: MediaQuery.of(context).size.height,   
                          enlargeCenterPage: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 20),  
                          onPageChanged: (index) {
                            setState(() {
                              switch(index) {
                                case 0: 
                                  colorName = Color.fromRGBO(59,124,116, 0.4);
                                  break;
                                case 1:
                                  colorName = Color.fromRGBO(103,148,186, 0.4);
                                  break;
                                case 2:
                                  colorName = Color.fromRGBO(21, 46, 48, 0.4);
                                  break;
                              }
                            });
                          },     
                          items: images.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: i.image,
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black.withOpacity(0.35),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3.5, left: 60), 
                        margin: EdgeInsets.symmetric(vertical: 60, horizontal: 60),  
                        color: Color.fromRGBO(175,193,191, 0.3),                   
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text(
                            'Explore a \nsua beleza', 
                            style: GoogleFonts.archivo(
                              fontSize: 80, 
                              color: Colors.white, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                          color: colorName,
                          child: Text(
                            'Enivaldo Moreira', 
                            style: GoogleFonts.archivo(
                              fontSize: 35, 
                              color: Colors.white,  
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),                
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[              
              Expanded(
                child: Container(
                  height: 100,
                )
              ),
              Container(
                padding: EdgeInsets.only(right: 60),
                child: Text('Home', style: GoogleFonts.archivo(fontSize: 20, color: Colors.white.withAlpha(200), fontWeight: FontWeight.bold),),
              ),
              Container(
                padding: EdgeInsets.only(right: 60),
                child: Text('Products', style: GoogleFonts.archivo(fontSize: 20, color: Colors.white.withAlpha(200), fontWeight: FontWeight.bold),),
              ),
              Container(
                padding: EdgeInsets.only(right: 60),
                child: Text('About', style: GoogleFonts.archivo(fontSize: 20, color: Colors.white.withAlpha(200), fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}