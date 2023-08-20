import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/pages/details_page.dart';
import 'package:valorant_wiki/pages/home_page.dart';
import 'package:valorant_wiki/pages/list_page.dart';
import 'package:valorant_wiki/pages/page.dart';
import 'package:valorant_wiki/providers/drawer_state.dart';

class MainPage extends StatefulWidget {
  String username;
  MainPage({super.key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> pages;

  int _selectedPage = 0;
  void setSelectedPage(int value) {
    _selectedPage = value;
  }
  int selectedPage() {
    return _selectedPage;
  }

  void lateInit() {
    pages = [
      HomePage(
        username: widget.username,
      ),
      const NewPage(),
      const AgentListPage(),
    ];
  }

  List<Widget> navbarIcons() {
    List<Widget> iconsList = [];
    iconsList.add(const Icon(Icons.home_filled, color: Colors.white, size: 32));
    iconsList.add(Image.asset(
      'assets/Valorant-Icon.png',
      fit: BoxFit.cover,
      color: Colors.white,
      height: 26,
      width: 26,
    ));
    iconsList.add(const Icon(Icons.table_rows, color: Colors.white, size: 32));
    return iconsList;
  }

  var drawerState = DrawerState.instance;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    lateInit();

    return Scaffold(
      body: Stack(
        children: [
          pages[selectedPage()],
          
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: DesignSystem.vmblue.withOpacity(0.8),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              setSelectedPage(index);
                            });
                          },
                          child: Column(
                            children: [
                              navbarIcons()[index],
                              const SizedBox(
                                height: 4,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                width: selectedPage() == index ? 16 : 0,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: DesignSystem.vred,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
