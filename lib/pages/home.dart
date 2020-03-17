import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  PageController controllerPage = PageController();
  int count = 0, randomPage;
  Random random = Random();
  AnimationController controller;
  Animation<double> animation;

  AnimationController _controller2;
  Animation<Offset> _offsetAnimation;

  AnimationController controller2;
  Animation<double> animation2;

  AnimationController _controller3;
  Animation<Offset> _offsetAnimation3;

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
    _paddingExplore = EdgeInsets.only(top: 160, left: 60);
    randomPage = random.nextInt(3);
    switch (randomPage) {
      case 0:
        colorName = Color.fromRGBO(59, 124, 116, 0.1);
        image = AssetImage("images/home2.jpg");
        break;
      case 1:
        colorName = Color.fromRGBO(103, 148, 186, 0.1);
        image = AssetImage("images/home3.jpg");
        break;
      case 2:
        colorName = Color.fromRGBO(21, 46, 48, 0.1);
        image = AssetImage("images/home4.jpg");
        break;
      default:
        colorName = Color.fromRGBO(21, 46, 48, 0.1);
        image = AssetImage("images/home4.jpg");
        break;
    }
    // colorName = Color.fromRGBO(59,124,116, 0.2);

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

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _offsetAnimation3 = Tween<Offset>(
      begin: Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.fastOutSlowIn,
    ));

    controllerMain = AnimationController(
        duration: const Duration(milliseconds: 3200), vsync: this);
    animationMain =
        CurvedAnimation(parent: controllerMain, curve: Curves.fastOutSlowIn);

    Future.delayed(const Duration(milliseconds: 2200), () {
      controllerMain.forward();
      controller.forward();
      _controller2.forward();
      _controller3.forward();
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
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: controllerPage,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
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
                                image: AssetImage("images/home2.jpg"), fit: BoxFit.cover)),
                      ),
                    ),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: FadeTransition(
                        opacity: animation,
                        child: Container(
                          padding: _paddingExplore,
                          margin: EdgeInsets.symmetric(
                              vertical: 60, horizontal: 60),
                          color: Color.fromRGBO(175, 193, 191, 0.3),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Text(
                              'Explore a \nsua beleza',
                              style: GoogleFonts.archivo(
                                  fontSize: 80,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment(0, 0.2),
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ],
                          tileMode: TileMode.mirror,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 0,
                      child: SlideTransition(
                        position: _offsetAnimation3,
                        child: FadeTransition(
                          opacity: animation2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 50),
                            color: colorName,
                            child: Text(
                              'Enivaldo Moreira',
                              style: GoogleFonts.archivo(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Another Page (1) ##########################################################

              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: AssetImage("images/home4.jpg"), fit: BoxFit.cover
                        )
                      ),
                    ),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: FadeTransition(
                        opacity: animation,
                        child: Container(
                          padding: _paddingExplore,
                          margin: EdgeInsets.symmetric(
                              vertical: 60, horizontal: 60),
                          color: Color.fromRGBO(175, 193, 191, 0.3),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Text(
                              'Explore a \nsua beleza',
                              style: GoogleFonts.archivo(
                                  fontSize: 80,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // CarouselSlider(
                    //   height: MediaQuery.of(context).size.height,
                    //   autoPlay: true,
                    //   autoPlayInterval: Duration(seconds: 10),
                    //   autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    //   viewportFraction: 0.8,
                    //   autoPlayCurve: Curves.fastOutSlowIn,
                    //   items: images.map((i) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           // margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //           decoration: BoxDecoration(
                    //             image: new DecorationImage(
                    //               image: i.image, fit: BoxFit.cover
                    //             )
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.35),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0, -0.2),
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ],
                          tileMode: TileMode.mirror,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 100,
              )),
              Container(
                padding: EdgeInsets.only(right: 60),
                child: Text(
                  'Home',
                  style: GoogleFonts.archivo(
                      fontSize: 20,
                      color: Colors.white.withAlpha(200),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 60),
                child: Text(
                  'Products',
                  style: GoogleFonts.archivo(
                      fontSize: 20,
                      color: Colors.white.withAlpha(200),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 60),
                child: Text(
                  'About',
                  style: GoogleFonts.archivo(
                      fontSize: 20,
                      color: Colors.white.withAlpha(200),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (count == 0) {
            controller.reverse();
            _controller2.reverse();
            _controller3.reverse();
            controller2.reverse();
            // await Future.delayed(Duration(milliseconds: 1000));
            controllerPage.animateToPage(1, duration: Duration(milliseconds: 2000), curve: Curves.fastOutSlowIn);
            // Future.delayed(const Duration(milliseconds: 2200), () {
              controller.forward();
              _controller2.forward();
              _controller3.forward();
              controller2.forward();
            // });
            count = 1;
          } else {         
            controllerPage.animateToPage(0, duration: Duration(milliseconds: 2000), curve: Curves.fastOutSlowIn);
            // Future.delayed(Duration(milliseconds: 2000));
            controller.forward();
            _controller2.forward();
            _controller3.forward();
            controller2.forward();
            setState(() {
              randomPage = random.nextInt(3);
              switch (randomPage) {
                case 0:
                  colorName = Color.fromRGBO(59, 124, 116, 0.1);
                  image = AssetImage("images/home2.jpg");
                  break;
                case 1:
                  colorName = Color.fromRGBO(103, 148, 186, 0.1);
                  image = AssetImage("images/home3.jpg");
                  break;
                case 2:
                  colorName = Color.fromRGBO(21, 46, 48, 0.1);
                  image = AssetImage("images/home4.jpg");
                  break;
                default:
                  colorName = Color.fromRGBO(21, 46, 48, 0.1);
                  image = AssetImage("images/home4.jpg");
                  break;
              }
            });            
            count = 0;
          }
        },
        child: Icon(Icons.navigation),
        backgroundColor: colorName,
      ),
    );
  }
}