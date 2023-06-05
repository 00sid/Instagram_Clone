import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/screens/chat_screen.dart';
import 'package:insta_clone/widgets/widget.dart';

class MessageCard extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final snap;
  const MessageCard({super.key, required this.snap});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: widget.snap['uid'] == FirebaseAuth.instance.currentUser!.uid
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.snap['photoUrl']),
                        radius: 28,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.snap['username'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Recent message',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
        ),
        const Divider(),
      ],
    );
  }
}
