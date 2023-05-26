class Creator {
  String name;
  String id;
  String handle;
  String pic;

  Creator({
    required this.name,
    required this.id,
    required this.handle,
    required this.pic,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    name: json["name"] ?? "",
    id: json["id"] ?? "",
    handle: json["handle"] ?? "",
    pic: json["pic"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "handle": handle,
    "pic": pic,
  };
}