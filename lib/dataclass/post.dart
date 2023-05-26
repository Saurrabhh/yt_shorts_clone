import 'dart:convert';
import 'creator.dart';
import 'comment.dart';
import 'reaction.dart';
import 'submission.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String postId;
  Creator creator;
  Comment comment;
  Reaction reaction;
  Submission submission;

  Post({
    required this.postId,
    required this.creator,
    required this.comment,
    required this.reaction,
    required this.submission,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    postId: json["postId"],
    creator: Creator.fromJson(json["creator"]),
    comment: Comment.fromJson(json["comment"]),
    reaction: Reaction.fromJson(json["reaction"]),
    submission: Submission.fromJson(json["submission"]),
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "creator": creator.toJson(),
    "comment": comment.toJson(),
    "reaction": reaction.toJson(),
    "submission": submission.toJson(),
  };
}








