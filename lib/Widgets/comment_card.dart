import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16,
      ),
      child: Row(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1660296444901-253891bb61c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1231&q=80'),
          radius: 18,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
        ),
      ]),
    );
  }
}
