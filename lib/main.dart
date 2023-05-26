import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yt_shorts_clone/screens/main_dashboard/main_dashboard.dart';
import 'package:yt_shorts_clone/services/posts_service.dart';
import 'package:yt_shorts_clone/services/video_player_service.dart';
import 'package:yt_shorts_clone/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostsService>(create: (_) => PostsService()),
        ChangeNotifierProvider<VideoPlayerService>(create: (_) => VideoPlayerService())
      ],
      child: MaterialApp(
        theme: MyTheme.themeData,
        home: const MainDashboard(),
      ),
    );
  }
}
