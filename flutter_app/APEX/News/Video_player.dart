import 'package:flutter/material.dart';
import 'package:flutter_app/entrance.dart';
import 'package:video_player/video_player.dart';

class APEXVideoPlayer extends StatefulWidget {
  @override
  _APEXVideoPlayerState createState() => _APEXVideoPlayerState();
}

class _APEXVideoPlayerState extends State<APEXVideoPlayer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://beautybox9.com/d1/480/75/75fffd8070e8418bb503978f51115e7df96717c7.mp4?md5=6tbb504ha0P2-VRkIUog4A&expires=1567689264')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('data'),
          backgroundColor: Color(0xff21212b),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip: 'arrow_back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: screenHeight,
          color: Color(0xff21212b),
          // height:screenHeight,
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
