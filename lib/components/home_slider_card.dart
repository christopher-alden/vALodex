import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/providers/home_character_data.dart';

GestureDetector homeSliderCard(item, context) {
  var homeCharacterData = HomeCharacterData.instance;
  return GestureDetector(
    onTap: () {
      homeCharacterData.setCharacterText(item['agent']);
      homeCharacterData.setCharacterImg(item['img']);
    },
    child: Stack(
      children: [
        Positioned(
          top: 30.0,
          left: 0.0,
          right: 0.0,
          bottom: 10.0,
          child: Transform(
            alignment: Alignment.bottomLeft,
            transform: Matrix4.skew(0.0, 0.1),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(int.parse(item['color'])),
                    Color(int.parse(item['color'])).withAlpha(40),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
          ),
        ),
        OverflowBox(
          maxHeight: double.infinity,
          alignment: Alignment.topCenter,
          child: Container(
            height: MediaQuery.of(context).size.height - 200,
            decoration: BoxDecoration(
              gradient: const RadialGradient(
                center: Alignment(0, 0),
                colors: [Colors.black26, Colors.transparent],
                stops: [0.4, 1.0],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(item['img']),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['agent'],
                style: const TextStyle(
                  letterSpacing: 1,
                  fontSize: 72,
                  height: 0.5,
                  fontFamily: 'bebas',
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      color: Color.fromARGB(125, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              Text(
                item['type'].toString().toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: DesignSystem.textsm,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
