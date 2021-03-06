import 'package:flutter/material.dart';
import 'package:halogram/pages/home.dart';
import 'package:halogram/widgets/header.dart';
import 'package:halogram/widgets/post.dart';
import 'package:halogram/widgets/progress.dart';

class PostScreen extends StatelessWidget {
  final String postId,userId;
  PostScreen({this.postId, this.userId});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsRef.document(userId).collection('usersPosts').document(postId).get(),
      builder: (context,snapshot){
        if (!snapshot.hasData)
          return circularProgress();
        Post post = Post.fromDocument(snapshot.data);
        return Center(
          child: Scaffold(
            appBar: header(context,pageTitle: post.caption),
            body: ListView(
              children: <Widget>[
                Container(
                  child: post,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
