import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valorant_wiki/components/valorant_icon.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/config/utils.dart';
import 'package:valorant_wiki/pages/detail_comment.dart';
import 'package:valorant_wiki/pages/detail_overview.dart';

class AgentDetails extends StatefulWidget {
  final String agent;
  const AgentDetails({Key? key, required this.agent}) : super(key: key);

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  late Future<Map<String, dynamic>?> data;
  Map<String, dynamic>? parsedData;

  @override
  void initState() {
    super.initState();
    data = Utils.loadSpecificData('assets/data/agents_data.json', widget.agent);
  }

  void _handleNavigateBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
        child: SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('ERROR LAGI'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }
          parsedData = snapshot.data;
          return Stack(
            children: [
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    // APPBAR NO COMPONENT
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 20, bottom: 5, left: 20, right: 20),
                        alignment: Alignment.topCenter,
                        width: double.infinity,
                        height: 60,
                        child: Row(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    _handleNavigateBack();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: DesignSystem.voffwhite,
                                  )),
                            ],
                          ),
                          const Spacer(),
                        ]),
                      ),
                    ),
                    const TabBar(
                      tabs: [
                        Tab(
                          child: Text("OVERVIEW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: DesignSystem.textsm,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                        ),
                        Tab(
                          child: Text("FORUM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: DesignSystem.textsm,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Center(
                            child: DetailOverview(data: parsedData),
                          ),
                          Center(child: DetailComment(data: parsedData)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
