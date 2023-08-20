import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:valorant_wiki/components/agent_cards.dart';
import 'package:valorant_wiki/components/drawer.dart';
import 'package:valorant_wiki/components/valorant_icon.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/config/navigator.dart';
import 'package:valorant_wiki/config/utils.dart';
import 'package:valorant_wiki/pages/details_page.dart';
import 'package:valorant_wiki/pages/main_page.dart';

class AgentListPage extends StatefulWidget {
  const AgentListPage({super.key});

  @override
  State<AgentListPage> createState() => _AgentListPageState();
}

class _AgentListPageState extends State<AgentListPage> {
  void _handleDetail(String key) {
    navigate(
        context,
        AgentDetails(
          agent: key,
        ),
        true);
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),
      body: Stack(
        children: [
          // SECTION SEARCH
          Positioned(
            top: 80,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: DesignSystem.px, vertical: DesignSystem.py),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "SEARCH AGENTS",
                      labelText: "SEARCH AGENTS",
                      iconColor: primaryColor,
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        color: primaryColor,
                      ),
                      labelStyle: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: DesignSystem.textsm,
                          fontWeight: FontWeight.normal),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // END SEARCH

          // SECTION LIST
          Positioned(
              top: 160,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: DesignSystem.px, vertical: DesignSystem.py),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 160,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future:
                      Utils.loadCarouselData("assets/data/carousel_data.json"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return GridView.builder(
                        padding: const EdgeInsets.only(bottom: 80),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 8.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final item = snapshot.data![index];

                          return GridTile(
                            key: item['agents'],
                            child: GestureDetector(
                              onTap: () {
                                _handleDetail(
                                    item['agent'].toString().toUpperCase());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2.0),
                                child: agentCards(item, context),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      );
                    }
                  },
                ),
              )),
          // END LIST

          //SECTION DRAWER
          const Positioned(top: 0, right: 0, child: CustomDrawer()),
          //END DRAWER

          //SECTION NAVBAR
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
                  child: const Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Choose Your Agents",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'bebas',
                                fontSize: DesignSystem.textlg,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5)),
                      ],
                    ),
                    Spacer(),
                    ValorantIcon(),
                  ]),
                ),
              ),
            ),
          ),
          //END NAVBAR
        ],
      ),
    );
  }
}
