import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:valorant_wiki/components/drawer.dart';
import 'package:valorant_wiki/components/home_character_display.dart';
import 'package:valorant_wiki/components/home_slider_card.dart';
import 'package:valorant_wiki/components/repeating_text.dart';
import 'package:valorant_wiki/components/valorant_icon.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/config/utils.dart';


class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isIconTapped = false;

  Color iconColor() {
    return isIconTapped ? Colors.white : DesignSystem.vred;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: DesignSystem.vmblue),
                    padding: const EdgeInsets.symmetric(
                        horizontal: DesignSystem.px, vertical: DesignSystem.py),
                    child: Column(
                      children: [
                        //THIS IS HERE TO PUSH THE THING DOWN, CANNOT BE ON TOP SINCE COLOR IS FROM CONTAINER
                        const SizedBox(
                          height: DesignSystem.gapl,
                        ),

                        //SECTION CAROUSEL
                        FutureBuilder<List<Map<String, dynamic>>>(
                          future: Utils.loadCarouselData(
                              "assets/data/carousel_data.json"),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return CarouselSlider(
                                options: CarouselOptions(
                                    height: 400.0,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 4),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 1500),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.3),
                                items: snapshot.data!.map((item) {
                                  return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      width: MediaQuery.of(context).size.width,
                                      child: homeSliderCard(item, context));
                                }).toList(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  //END CAROUSEL

                  //GAP
                  const SizedBox(
                    height: DesignSystem.gapl,
                  ),
                  //END GAP

                  //SECTION NEW SHOWCASE
                  SizedBox(
                    width: double.infinity,
                    height: 850,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 40,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Color.fromARGB(255, 249, 249, 249),
                                    DesignSystem.voffwhite
                                  ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter)),
                            )),
                       
                       
                        Positioned(
                            child: Container(
                          height: 75,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              color: DesignSystem.vmblue),
                        )),
                        const Positioned(
                            right: 20,
                            top: 30,
                            child: Text(
                              "EPISODE_07 // ACT I / YR 3",
                              style: TextStyle(
                                  color: DesignSystem.voffwhite,
                                  fontSize: DesignSystem.textxs,
                                  letterSpacing: 2.0),
                            )),
                        const Positioned(
                            right: 50,
                            top: 150,
                            child: RepeatingText(repeatCount: 7)),
                        const Positioned(
                            top: -35,
                            left: -190,
                            child: HomeCharacterDisplay()),
                        Positioned(
                            bottom: 0,
                            child: Image.asset(
                              'assets/Maps/Split-Bg.png',
                              height: 300,
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  ),
                  //END NEW SHOWCASE
                ],
              ),
            ]),
          ),
        ),
         //SECTION DRAWER
          const Positioned(top: 0, right: 0, child: CustomDrawer()),
          //END DRAWER
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 5, left: 20, right: 20),
                alignment: Alignment.topCenter,
                width: double.infinity,
                height: 60,
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WELCOME AGENT,",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'bebas',
                              fontSize: DesignSystem.textlg,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ],
                  ),
                  const Spacer(),
                  ValorantIcon(),
                ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
