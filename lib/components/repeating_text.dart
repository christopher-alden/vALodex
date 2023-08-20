import 'package:flutter/material.dart';
import 'package:valorant_wiki/providers/home_character_data.dart';

class RepeatingText extends StatefulWidget {
  final int repeatCount;

  const RepeatingText({super.key, required this.repeatCount});

  @override
  State<RepeatingText> createState() => _RepeatingTextState();
}

class _RepeatingTextState extends State<RepeatingText> {
  final HomeCharacterData homeCharacterData = HomeCharacterData.instance;
  String? characterText;

  @override
  void initState() {
    super.initState();
    homeCharacterData.addListener(_updateData);
  }

  @override
  void dispose() {
    homeCharacterData.removeListener(_updateData);
    super.dispose();
  }

  void _updateData() {
    setState(() {
      characterText = homeCharacterData.getCharacterText();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    String name = homeCharacterData.getCharacterText();
    for (int i = 0; i < widget.repeatCount; i++) {
      widgets.add(
        Transform.translate(
          offset: Offset(0, -20.0 * i),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 72,
                fontFamily: 'bebas',
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(100 - (i * 10))),
              
          ),
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
