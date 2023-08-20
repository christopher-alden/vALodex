import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:valorant_wiki/config/design.dart';

class DetailOverview extends StatefulWidget {
  final Map<String, dynamic>? data;
  const DetailOverview({super.key, required this.data});

  @override
  State<DetailOverview> createState() => _DetailOverviewState();
}

class _DetailOverviewState extends State<DetailOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height+300,
          child: Stack(
            children: [
              Positioned(
                  top: 40,
                  right: 20,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Text(
                      widget.data!['agent'],
                      style: TextStyle(
                          overflow: TextOverflow.clip,
                          color: DesignSystem.voffwhite.withOpacity(0.1),
                          fontFamily: 'bebas',
                          fontSize: 160),
                      textAlign: TextAlign.right,
                    ),
                  )),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    widget.data!['img'],
                    height: 400,
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(.8),
                  ),
                ),
              ),
              Positioned(
                  top: 280,
                  left: 20,
                  child: Text(
                      widget.data!['agent'],
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          color: DesignSystem.voffwhite,
                          fontFamily: 'bebas',
                          fontSize: 90,
                          shadows: [
                        Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(125, 0, 0, 0),
                        ),
                      ],),
                      textAlign: TextAlign.right,
                    ),),
              Positioned(
                top: 460,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  const Text(
                    "Bio",
                    style: TextStyle(
                        fontFamily: 'bebas',
                        color: DesignSystem.voffwhite,
                        fontSize: DesignSystem.textxl),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width-100,
                    child: Text(
                      widget.data!['description'],
                      softWrap: true,
                      style: const TextStyle(
                        height: 1.5,
                        letterSpacing: 1.5,
                        overflow: TextOverflow.fade,
                          color: DesignSystem.voffwhite,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: DesignSystem.gapl,),
              const Text(
                    "Skills",
                    style: TextStyle(
                        fontFamily: 'bebas',
                        color: DesignSystem.voffwhite,
                        fontSize: DesignSystem.textxl),
                  ),
                ]),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
