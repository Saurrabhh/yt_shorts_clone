import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../dataclass/post.dart';

class VideoPlayerService extends ChangeNotifier {
  late List<VideoPlayerController> _videoControllers;

  List<VideoPlayerController> get videoControllers => _videoControllers;

  List<Post> _posts = [];

  List<Post> get posts => _posts;

  late int _selectedVideoIndex;

  int get selectedVideoIndex => _selectedVideoIndex;

  createVideoControllers(List<Post> dataSources, int index) async {
    _selectedVideoIndex = 0;
    _posts = dataSources;
    _videoControllers = dataSources.map((post) {
      final videoController =
          VideoPlayerController.network(post.submission.mediaUrl)
            ..setLooping(true);
      initialiseVideoPlayer(videoController);
      return videoController;
    }).toList();
    _videoControllers[0].play();
    notifyListeners();
  }

  initialiseVideoPlayer(VideoPlayerController videoPlayerController) =>
    videoPlayerController.initialize().then((value) => notifyListeners());


  setReaction(int index) {
    _posts[index].reaction.voted = !_posts[index].reaction.voted;
    _posts[index].reaction.voted
        ? _posts[index].reaction.count++
        : _posts[index].reaction.count--;

    notifyListeners();
  }

  playPause(int index) =>
      _videoControllers[index].value.isPlaying ? pause(index) : play(index);

  pause(int index) => _videoControllers[index].pause();

  play(int index) => _videoControllers[index].play();

  setNewVideo(int newIndex) {
    _videoControllers[selectedVideoIndex].pause();
    _selectedVideoIndex = newIndex;
    _videoControllers[newIndex].play();
  }

  clear() {
    for (VideoPlayerController controller in _videoControllers) {
      controller.dispose();
    }
    _videoControllers.clear();
    _posts.clear();
  }
}
