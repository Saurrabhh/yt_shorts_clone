
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../dataclass/post.dart';

class VideoPlayerService extends ChangeNotifier {
  List<VideoPlayerController> _videoControllers = [];
  List<Post> _posts = [];
  List<Post> get posts => _posts;

  List<VideoPlayerController> get videoControllers => _videoControllers;

  late int _selectedVideoIndex;

  int get selectedVideoIndex => _selectedVideoIndex;

  initialise(List<Post> dataSources, int index) async {
    _videoControllers = dataSources
        .map((post) => VideoPlayerController.network(post.submission.mediaUrl)
          ..initialize()
          ..setLooping(true)).toList();
    _selectedVideoIndex = 0;
    _videoControllers[0].play();
    _posts = dataSources;
  }

  setReaction(int index){
    _posts[index].reaction.voted = !_posts[index].reaction.voted;
    notifyListeners();
  }

  // addVideoControllers(List<Post> dataSources) {
  //   _videoControllers = dataSources
  //       .map((post) => VideoPlayerController.network(post.submission.mediaUrl)
  //         ..initialize()
  //         ..setLooping(true)).toList();
  // }

  setNewVideo(int newIndex) async {
    _videoControllers[selectedVideoIndex].pause();
    _selectedVideoIndex = newIndex;
    // if(!_videoControllers[newIndex].value.isInitialized){
    //   _videoControllers[newIndex] = VideoPlayerController.network(_videoControllers[newIndex].dataSource);
    //   await _videoControllers[newIndex].initialize();
    //   await _videoControllers[newIndex].setLooping(true);
    // }
    _videoControllers[newIndex].play();
  }

  @override
  void dispose() {
    for (VideoPlayerController controller in _videoControllers) {
      controller.dispose();
    }
    _videoControllers.clear();
    super.dispose();
  }
}
