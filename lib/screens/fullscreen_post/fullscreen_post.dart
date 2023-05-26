import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:yt_shorts_clone/dataclass/post.dart';
import 'package:yt_shorts_clone/screens/fullscreen_post/components/square_avatar.dart';
import 'package:yt_shorts_clone/services/video_player_service.dart';

import 'components/icon_button.dart';
import 'components/text_description.dart';

class FullScreenPost extends StatelessWidget {
  const FullScreenPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPlayerService = Provider.of<VideoPlayerService>(context);
    final posts = videoPlayerService.posts;
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videoPlayerService.videoControllers.length,
            onPageChanged: videoPlayerService.setNewVideo,
            itemBuilder: (context, index) {
              final videoController =
                  videoPlayerService.videoControllers[index];
              final post = posts[index];
              return GestureDetector(
                onTap: () => videoController.value.isPlaying
                    ? videoController.pause()
                    : videoController.play(),
                onDoubleTap: () => videoPlayerService.setReaction(index),
                onLongPress: videoController.pause,
                onLongPressUp: videoController.play,
                child: Stack(children: [
                  VideoPlayer(videoController),
                  buildGradient(),
                  buildInfo(post, index, context)
                ]),
              );
            }),
      ),
    );
  }

  Widget buildInfo(Post post, int index, BuildContext context) {
    return Positioned.fill(
      bottom: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Post",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 25),
                )),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildPostData(post, context),
                buildVerticalIcons(post, index, context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPostData(Post post, BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextDescription(
                title: post.submission.title,
                description: post.submission.description),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(post.creator.pic),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "@${post.creator.handle}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildVerticalIcons(Post post, int index, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomIconButton(
          iconData: Icons.thumb_up,
          subtitle: post.reaction.count.toString(),
          color: post.reaction.voted ? Colors.blue : Colors.white,
          onPressed: () =>
              Provider.of<VideoPlayerService>(context).setReaction(index),
        ),
        CustomIconButton(
          iconData: Icons.comment,
          subtitle: post.comment.count.toString(),
          onPressed: () {},
        ),
        CustomIconButton(
          iconData: Icons.share,
          subtitle: "Share",
          onPressed: () => Share.share("Here a is post by ${post.creator.handle}: ${post.submission.hyperlink}"),
        ),
        SquareAvatar(imgUrl: post.creator.pic)
      ],
    );
  }

  Widget buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black45],
            stops: [0.5, 1.0],
          ),
        ),
      ),
    );
  }
}
