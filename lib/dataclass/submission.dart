class Submission {

  String title;
  String description;
  String mediaUrl;
  String thumbnail;
  String hyperlink;
  String placeholderUrl;

  Submission({
    required this.title,
    required this.description,
    required this.mediaUrl,
    required this.thumbnail,
    required this.hyperlink,
    required this.placeholderUrl,
  });

  factory Submission.fromJson(Map<String, dynamic> json) => Submission(
    title: json["title"],
    description: json["description"],
    mediaUrl: json["mediaUrl"],
    thumbnail: json["thumbnail"],
    hyperlink: json["hyperlink"],
    placeholderUrl: json["placeholderUrl"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "mediaUrl": mediaUrl,
    "thumbnail": thumbnail,
    "hyperlink": hyperlink,
    "placeholderUrl": placeholderUrl,
  };
}