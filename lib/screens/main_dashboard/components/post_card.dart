import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yt_shorts_clone/screens/fullscreen_post/components/avatars.dart';
import 'package:yt_shorts_clone/screens/fullscreen_post/fullscreen_post.dart';
import 'package:yt_shorts_clone/services/posts_service.dart';
import 'package:yt_shorts_clone/services/video_player_service.dart';

import '../../../dataclass/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post, required this.index})
      : super(key: key);
  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openFullScreen(context),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            buildThumbnail(),
            buildGradient(),
            buildInfo(context),
            const Positioned(
              top: 5,
              right: 5,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildThumbnail() {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Image.network(
          post.submission.thumbnail,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, loadingProgress) {
            return loadingProgress == null ? child : Image.network(post.submission.placeholderUrl);
          },
        ));
  }

  Widget buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black87],
            stops: [0.5, 1.0],
          ),
        ),
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Row(
        children: [
          CircularAvatar(
            imgUrl: post.creator.pic,
            radius: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "@${post.creator.handle}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  openFullScreen(BuildContext context) {
    final posts = Provider.of<PostsService>(context, listen: false).posts;
    final videoPlayerService =
        Provider.of<VideoPlayerService>(context, listen: false);

    videoPlayerService.createVideoControllers(
        posts.sublist(
            index, index + 10 > posts.length - 1 ? posts.length : index + 10),
        index);
    Navigator.push(
            context, MaterialPageRoute(builder: (_) => const FullScreenPost()))
        .then((value) => videoPlayerService.clear());
  }
}
