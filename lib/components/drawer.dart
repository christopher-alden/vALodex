import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/pages/landing_page.dart';
import 'package:valorant_wiki/providers/drawer_state.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

const int popupDelay = 2;

class _CustomDrawerState extends State<CustomDrawer> {
  var drawerState = DrawerState.instance;
  bool state = false;

  void handleLogout() {
    SnackBar snackBar = SnackBar(
        content: Text("Logging Out"), duration: Duration(seconds: popupDelay));

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );

    Future.delayed(const Duration(seconds: popupDelay), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return LandingPage();
      }), (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    drawerState.addListener(_updateDrawerState);
  }

  @override
  void dispose() {
    drawerState.removeListener(_updateDrawerState);
    super.dispose();
  }

  void _updateDrawerState() {
    setState(() {
      state = drawerState.getIsDrawerOpen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
      width: state ? MediaQuery.of(context).size.width : 0,
      height: MediaQuery.of(context).size.height,
      child: Container(
        alignment: Alignment.centerRight,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, DesignSystem.vmblue],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  drawerState.toggleState();
                },
                child: const Text(
                  'INSTALL',
                  style: TextStyle(
                      fontFamily: 'bebas', color: Colors.white, fontSize: 72),
                  softWrap: false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  drawerState.toggleState();
                },
                child: const Text(
                  'LIGHT MODE',
                  style: TextStyle(
                      fontFamily: 'bebas', color: Colors.white, fontSize: 72),
                  softWrap: false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  drawerState.toggleState();
                  handleLogout();
                },
                child: const Text(
                  'LOG OUT',
                  style: TextStyle(
                      fontFamily: 'bebas', color: Colors.white, fontSize: 72),
                  softWrap: false,
                ),
              )
            ]),
      ),
    );
  }
}
