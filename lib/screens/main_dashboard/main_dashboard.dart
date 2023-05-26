import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yt_shorts_clone/services/posts_service.dart';

import 'components/posts.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postsService = Provider.of<PostsService>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      postsService.fetchPosts();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts",style: Theme.of(context).textTheme.titleLarge,)
      ),
      body: Consumer<PostsService>(
        builder: (BuildContext context, postsService, Widget? child) {
          return RefreshIndicator(
            onRefresh:
              postsService.refreshPosts,
            child: SingleChildScrollView(
              controller: postsService.scrollController,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Posts(posts: postsService.posts),
                    postsService.isLoading
                        ? buildLoading()
                        : postsService.noMorePosts
                            ? buildNoMore()
                            : buildLoading(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    );
  }

  Widget buildNoMore() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("No More Videos"),
    );
  }
}
