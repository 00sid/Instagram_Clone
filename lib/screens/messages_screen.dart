import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/providers/user_provider.dart';
import 'package:insta_clone/resources/firestore_method.dart';
import 'package:insta_clone/screens/chat_screen.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/message_card.dart';
import 'package:insta_clone/widgets/widget.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var friendSnap;
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().getUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("Messages"),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        friendSnap =
                            (snapshot.data! as dynamic).docs[index].data();
                        await FirestoreMethod().createChat(
                            user!.uid,
                            friendSnap['uid'],
                            user.username,
                            friendSnap['username']);

                        nextScreen(
                            context,
                            ChatScreen(
                              snap: (snapshot.data! as dynamic)
                                  .docs[index]
                                  .data(),
                            ));
                      },
                      child: MessageCard(
                          snap: (snapshot.data! as dynamic).docs[index].data()),
                    );
                  });
            }
            return SizedBox();
          }),
    );
  }
}
