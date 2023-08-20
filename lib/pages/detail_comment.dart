import 'package:flutter/material.dart';
import 'package:valorant_wiki/config/design.dart';
import 'package:valorant_wiki/providers/comments_state.dart';

class DetailComment extends StatefulWidget {
  final Map<String, dynamic>? data;
  const DetailComment({super.key, required this.data});

  @override
  State<DetailComment> createState() => _DetailCommentState();
}

class _DetailCommentState extends State<DetailComment> {
  final commentState = CommentState.instance;

  final TextEditingController commentController = TextEditingController();

  void _addCommentto(String agent, String comment) {
    commentState.addComment(agent, comment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: commentState
                  .getCommentsForAgent(widget.data!['agent'])
                  .length,
              itemBuilder: (context, index) {
                var temp =
                    commentState.getCommentsForAgent(widget.data!['agent']);

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.comment,
                        color: Colors.white,
                      ),
                      SizedBox(width: DesignSystem.gapm,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("AL23-2", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          Text(temp[index].text, style: TextStyle(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                );
                // return ListTile(
                //     leading: const Icon(
                //       Icons.comment,
                //       color: Colors.white,
                //     ),
                //     title: Text(temp[index].text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextField(
              controller: commentController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "COMMENT",
                labelText: "COMMENT",
                iconColor: DesignSystem.voffwhite,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _addCommentto(
                          widget.data!['agent'], commentController.text);
                    });
                  },
                  child: const Icon(
                    Icons.send_rounded,
                    color: DesignSystem.voffwhite,
                  ),
                ),
                labelStyle: const TextStyle(
                    color: DesignSystem.voffwhite, fontWeight: FontWeight.bold),
                fillColor: Colors.white,
                hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: DesignSystem.textsm,
                    fontWeight: FontWeight.normal),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: DesignSystem.voffwhite),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: DesignSystem.voffwhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
