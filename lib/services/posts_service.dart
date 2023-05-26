import 'package:flutter/cupertino.dart';
import 'package:yt_shorts_clone/constants.dart';
import 'package:yt_shorts_clone/services/api_service.dart';

import '../dataclass/post.dart';

class PostsService extends ChangeNotifier {
  late ScrollController scrollController;

  final List<Post> _postsList = [];
  List<Post> get posts => _postsList;

  bool _noMorePosts = false;
  bool get noMorePosts => _noMorePosts;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  int _page = 0;

  PostsService() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange &&
        !_isLoading) {
      fetchPosts();
    }
  }

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<List<Post>> fetchPosts() async {
    setLoading(true);
    final response = await ApiService.get(baseUrl, {"page": _page.toString()});
    if (response == null) {
      return [];
    }
    final responseList = response['data']['posts'] as List;
    final newPostsList = List<Post>.generate(
        responseList.length, (index) => Post.fromJson(responseList[index]));
    _postsList.addAll(newPostsList);
    if (responseList.isNotEmpty) _page ++;
    _noMorePosts = responseList.isEmpty;
    setLoading(false);
    return newPostsList;
  }

  Future<void> refreshPosts() async {
    _page = 0;
    _postsList.clear();
    await fetchPosts();
  }
}
