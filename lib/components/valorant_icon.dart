import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/providers/drawer_state.dart';

class ValorantIcon extends StatefulWidget {
  const ValorantIcon({super.key});

  @override
  State<ValorantIcon> createState() => _ValorantIconState();
}

class _ValorantIconState extends State<ValorantIcon> {
  var drawerState = DrawerState.instance;
  bool state = false;

  Color iconColor() {
    return state ? DesignSystem.vred : Colors.white;
  }

 @override
  void initState() {
    super.initState();
    state = drawerState.getIsDrawerOpen();
    drawerState.addListener(_updateIconState);
  }

  @override
  void dispose() {
    drawerState.removeListener(_updateIconState);
    super.dispose();
  }

  void _updateIconState() {
    setState(() {
      state = drawerState.getIsDrawerOpen();
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          drawerState.toggleState();
        });
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: iconColor(), width: 2.0)),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            'assets/Valorant-Icon.png',
            fit: BoxFit.cover,
            color: iconColor(),
          ),
        ),
      ),
    );
  }
}
