import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  AnimationController _controller2;
  Animation<Offset> _offsetAnimation;

  AnimationController controller2;
  Animation<double> animation2;

  AnimationController controllerMain;
  Animation<double> animationMain;

  List<Image> images = List<Image>();
  ImageProvider image;
  EdgeInsetsGeometry _paddingExplore;
  Color colorName;
  bool initial;

  @override
  void initState() {
    super.initState();
    colorName = Color.fromRGBO(59,124,116, 0.4);
    _paddingExplore = EdgeInsets.only(top: 160, left: 60);
    image = AssetImage("images/home2.jpg");

    controller = AnimationController(
      duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn); 

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.02),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.fastOutSlowIn,
    ));
    
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 2000), vsync: this);
    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeIn); 

    controllerMain = AnimationController(
      duration: const Duration(milliseconds: 3000), vsync: this);
    animationMain = CurvedAnimation(parent: controllerMain, curve: Curves.fastOutSlowIn); 
    controllerMain.forward();

    Future.delayed(const Duration(milliseconds: 2500), () {
      controller.forward();
      _controller2.forward();
      controller2.forward();
    });

    images.add(Image(image: AssetImage("images/home2.jpg")));
    images.add(Image(image: AssetImage("images/home3.jpg")));
    images.add(Image(image: AssetImage("images/home4.jpg")));
    initial = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      FadeTransition(
                        opacity: animationMain,
                        child: Container(
                          padding: _paddingExplore,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: new BoxDecoration(                            
                            image: new DecorationImage(
                                image: image,
                                fit: BoxFit.cover
                            )
                          ),
                          // child: CarouselSlider(              
                          //   height: MediaQuery.of(context).size.height,   
                          //   enlargeCenterPage: false,
                          //   autoPlay: true,
                          //   autoPlayInterval: Duration(seconds: 20),  
                          //   onPageChanged: (index) {
                          //     setState(() {
                          //       switch(index) {
                          //         case 0: 
                          //           colorName = Color.fromRGBO(59,124,116, 0.4);
                          //           break;
                          //         case 1:
                          //           colorName = Color.fromRGBO(103,148,186, 0.4);
                          //           break;
                          //         case 2:
                          //           colorName = Color.fromRGBO(21, 46, 48, 0.4);
                          //           break;
                          //       }
                          //     });
                          //   },     
                          //   items: images.map((i) {
                          //     return Builder(
                          //       builder: (BuildContext context) {
                          //         return Container(
                          //           width: MediaQuery.of(context).size.width,
                          //           height: MediaQuery.of(context).size.height,
                          //           decoration: BoxDecoration(
                          //             image: DecorationImage(
                          //               image: i.image,
                          //               fit: BoxFit.cover
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   }).toList(),
                          // ),
                        ),
                      ),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: FadeTransition(
                          opacity: animation,
                          child: Container(
                            padding: _paddingExplore, 
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
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black.withOpacity(0.35),
                      ),
                      
                      FadeTransition(
                        opacity: animationMain,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment(0, 0.2), // 10% of the width, so there are ten blinds.
                              colors: [Colors.black, Colors.transparent], // whitish to gray
                              tileMode: TileMode.mirror, // repeats the gradient over the canvas
                            ),
                          ),
                        ),
                      ),
                      
                      Positioned(
                        bottom: 50,
                        right: 0,
                        child: FadeTransition(
                          opacity: animation2,
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
                      ),
                    ],
                  ),
                ),                
              ],
            ),
          ),
          FadeTransition(
            opacity: animation2,
            child: Row(
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
          ),
        ],
      ),
    );
  }
}