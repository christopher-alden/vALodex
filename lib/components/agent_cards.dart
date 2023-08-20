import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';

Stack agentCards(item, context) {
  return Stack(children: [
    Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        top: 50,
        child: Container(
          transform: Matrix4.skewY(0.3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(int.parse(item['color'])),
                  Color(int.parse(item['color'])).withOpacity(0.2),
                ],
              )),
        )),
    Positioned(
      right: -60,
      bottom: -60,
      top: 0,
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Image.asset(
              item['img'],
              fit: BoxFit.cover,
            ),
          ])),
    ),
    Positioned(
        bottom: 10,
        left: 10,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            item['agent'],
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'bebas',
              fontSize: DesignSystem.textlg,
              height: 0.5,
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
              color: Colors.white,
              fontSize: DesignSystem.textxs,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  color: Color.fromARGB(125, 0, 0, 0),
                ),
              ],
            ),
          ),
        ]))
  ]);
}
