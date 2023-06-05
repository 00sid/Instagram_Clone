import 'package:flutter/material.dart';
import 'package:insta_clone/screens/profile_screen.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/widget.dart';

class ChatScreen extends StatefulWidget {
  final snap;
  const ChatScreen({super.key, required this.snap});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                nextScreen(context, ProfileScreen(uid: widget.snap['uid']));
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.snap['photoUrl']),
                radius: 18,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(widget.snap['username']),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.info))],
      ),
      body: Stack(
        children: <Widget>[
          //chat messages here
          //   chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      //  controller: messageController,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hoverColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Send a message",
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      //       sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
