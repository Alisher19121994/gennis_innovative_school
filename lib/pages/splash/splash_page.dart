import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:http/http.dart' as http;
import '../../controller/splash_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id = "splashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    fetchUser();
    Get.find<SplashController>().hasLoggedInByUser();
  }

  Future<void> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    runApp(MaterialApp(
        home: status == true ? const EntrancePage() : const SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C2FF),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(100),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ProjectImages.allLogo),
          )),
        ),
      ),
    );
  }
}

/**
 *
 * Sure! Here's an example of a Flutter code that creates a REST API to display a video player:

    ```dart
    import 'dart:convert';
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'package:video_player/video_player.dart';

    void main() => runApp(MyApp());

    class Video {
    final int id;
    final String title;
    final String url;

    Video({this.id, this.title, this.url});

    factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
    id: json['id'],
    title: json['title'],
    url: json['url'],
    );
    }
    }

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Video Player',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: HomePage(),
    );
    }
    }

    class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
    }

    class _HomePageState extends State<HomePage> {
    List<Video> videos = [];
    VideoPlayerController _controller;

    @override
    void initState() {
    super.initState();
    fetchVideos();
    }

    void fetchVideos() async {
    final response = await http.get(Uri.parse('https://api.example.com/videos'));
    if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    setState(() {
    videos = data.map<Video>((json) => Video.fromJson(json)).toList();
    });
    }
    }

    @override
    void dispose() {
    _controller.dispose();
    super.dispose();
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('Video Player'),
    ),
    body: ListView.builder(
    itemCount: videos.length,
    itemBuilder: (BuildContext context, int index) {
    final video = videos[index];
    return ListTile(
    leading: Icon(Icons.play_arrow),
    title: Text(video.title),
    onTap: () {
    _controller = VideoPlayerController.network(video.url)
    ..initialize().then((_) {
    setState(() {});
    _controller.play();
    });
    },
    );
    },
    ),
    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.stop),
    onPressed: () {
    _controller.pause();
    },
    ),
    );
    }
    }
    ```

    Make sure to replace the API URL (`https://api.example.com/videos`) with your actual URL that returns a JSON array of video objects.
 * **/
