class Comment {
  int count;
  bool commentingAllowed;

  Comment({
    required this.count,
    required this.commentingAllowed,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    count: json["count"],
    commentingAllowed: json["commentingAllowed"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "commentingAllowed": commentingAllowed,
  };
}