import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Coming Soon", style: TextStyle(fontFamily: 'valorant', fontSize: DesignSystem.textlg, color: DesignSystem.vred), textAlign: TextAlign.center,),
      ),
    );
  }
}