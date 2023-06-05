import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/screens/messages_screen.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          "assets/ic_instagram.svg",
          // ignore: deprecated_member_use
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, PageTransition(const MessagesScreen()));
            },
            icon: const Icon(Icons.messenger_outline),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;
  PageTransition(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(
              milliseconds: 2000,
            ),
            reverseTransitionDuration: const Duration(
              milliseconds: 400,
            ),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                parent: animation,
                curve: Curves.fastLinearToSlowEaseIn,
                reverseCurve: Curves.fastOutSlowIn,
              );
              return Align(
                alignment: Alignment.centerRight,
                child: SizeTransition(
                  sizeFactor: animation,
                  child: page,
                  axisAlignment: 0,
                  axis: Axis.horizontal,
                ),
              );
            });
}
