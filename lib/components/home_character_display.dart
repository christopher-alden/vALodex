import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:valorant_wiki/providers/home_character_data.dart';

class HomeCharacterDisplay extends StatefulWidget {
  const HomeCharacterDisplay({super.key});

  @override
  State<HomeCharacterDisplay> createState() => _HomeCharacterDisplayState();
}

class _HomeCharacterDisplayState extends State<HomeCharacterDisplay> {
  final HomeCharacterData homeCharacterData = HomeCharacterData.instance;
  String? characterImg;

  @override
  void initState() {
    super.initState();
    characterImg = homeCharacterData.getCharacterImg();
    homeCharacterData.addListener(_updateData);
  }

  @override
  void dispose() {
    homeCharacterData.removeListener(_updateData);
    super.dispose();
  }

  void _updateData() {
    setState(() {
      characterImg = homeCharacterData.getCharacterImg();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SimpleShadow(
          color: Colors.black45,
          offset: Offset(5.0, 5.0),
          sigma: 5,
          child: Image.asset(
            characterImg!,
            height: 550,
            fit: BoxFit.cover,
          ),
        ));
  }
}
