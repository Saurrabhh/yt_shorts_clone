import 'package:flutter/material.dart';
import 'package:yt_shorts_clone/dataclass/post.dart';
import 'package:yt_shorts_clone/screens/main_dashboard/components/post_card.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key, required this.posts}) : super(key: key);
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 9 / 16),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: posts.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => PostCard(post: posts[index],index: index,),);
  }
}
