import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  Post({
    required this.likes,
    required this.description,
    required this.uid,
    required this.postId,
    required this.username,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'description': description,
        'postId': postId,
        'datePublished': datePublished,
        'postUrl': postUrl,
        'profImage': profImage,
        'likes': likes,
      };

  static Post fromSnap(DocumentSnapshot snapshot) {
    var snaphot = snapshot.data() as Map<String, dynamic>;
    return Post(
      description: snaphot['description'],
      uid: snaphot['uid'],
      postId: snaphot['postId'],
      username: snaphot['username'],
      datePublished: snaphot['datePublished'],
      postUrl: snaphot['postUrl'],
      profImage: snaphot['profImage'],
      likes: snaphot['likes'],
    );
  }
}
