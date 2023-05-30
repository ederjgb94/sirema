import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String url;
  const VideoPage({super.key, required this.url});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/${widget.url}')
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SIREMA',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            letterSpacing: 10,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/encabezado_suma.png',
                  scale: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: IgnorePointer(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: Row(
      //   mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SizedBox(
      //       width: 100,
      //       height: 100,
      //       child: FloatingActionButton(
      //         backgroundColor: Colors.pink,
      //         heroTag: null,
      //         onPressed: () {
      //           setState(() {
      //             _controller.value.volume == 0
      //                 ? _controller.setVolume(1)
      //                 : _controller.setVolume(0);
      //           });
      //         },
      //         child: Icon(
      //           _controller.value.volume == 0
      //               ? Icons.volume_off
      //               : Icons.volume_up,
      //           size: 40,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       width: 20,
      //     ),
      //     SizedBox(
      //       width: 100,
      //       height: 100,
      //       child: FloatingActionButton(
      //         backgroundColor: Colors.pink,
      //         heroTag: null,
      //         onPressed: () {
      //           setState(() {
      //             _controller.value.isPlaying
      //                 ? _controller.pause()
      //                 : _controller.play();
      //           });
      //         },
      //         child: Icon(
      //           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //           size: 40,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
