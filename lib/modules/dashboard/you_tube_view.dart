import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeView extends StatefulWidget {
  const YouTubeView({super.key});

  @override
  State<YouTubeView> createState() => _YouTubeViewState();
}

class _YouTubeViewState extends State<YouTubeView> {
   YoutubePlayerController playerController=YoutubePlayerController(initialVideoId: 'nPt8bK2gbaU');
  late PlayerState _playerState;
  // late YoutubeMetaData _videoMetaData;

    @override
    void initState() {
      playerController=YoutubePlayerController(
        initialVideoId: 'nPt8bK2gbaU',
        flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
      super.initState();
    }
  @override
  Widget build(BuildContext context) {

  //   void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //       _playerState = _controller.value.playerState;
  //       _videoMetaData = _controller.metadata;
  //     });
  //   }
  // }
     return Expanded(
              flex: 5,
       child: YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          // SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: playerController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                playerController.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                // log('Settings Tapped!');
              },
            ),
          ],
          // onReady: () {
          //   _isPlayerReady = true;
          // },
          // onEnded: (data) {
          //   _controller
          //       .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          //   _showSnackBar('Next Video Started!');
          // },
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Image.asset(
                'assets/ypf.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            title: const Text(
              'Youtube Player Flutter',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.video_library),
                onPressed: () => {}
                // Navigator.push(
                //   // context,
                //   // CupertinoPageRoute(
                //   //   builder: (context) => VideoList(),
                //   // ),
                // ),
              ),
            ],
          ),
          body: ListView(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // _space,
                    // _text('Title', _videoMetaData.title),
                    // _space,
                    // _text('Channel', _videoMetaData.author),
                    // _space,
                    // _text('Video Id', _videoMetaData.videoId),
                    // _space,
                    // Row(
                    //   children: [
                    //     _text(
                    //       'Playback Quality',
                    //       _controller.value.playbackQuality ?? '',
                    //     ),
                    //     const Spacer(),
                    //     _text(
                    //       'Playback Rate',
                    //       '${_controller.value.playbackRate}x  ',
                    //     ),
                    //   ],
                    // ),
                    // _space,
                    // TextField(
                    //   enabled: _isPlayerReady,
                    //   controller: _idController,
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     hintText: 'Enter youtube \<video id\> or \<link\>',
                    //     fillColor: Colors.blueAccent.withAlpha(20),
                    //     filled: true,
                    //     hintStyle: const TextStyle(
                    //       fontWeight: FontWeight.w300,
                    //       color: Colors.blueAccent,
                    //     ),
                    //     suffixIcon: IconButton(
                    //       icon: const Icon(Icons.clear),
                    //       onPressed: () => _idController.clear(),
                    //     ),
                    //   ),
                    // ),
                    // _space,
                    // Row(
                    //   children: [
                    //     _loadCueButton('LOAD'),
                    //     const SizedBox(width: 10.0),
                    //     _loadCueButton('CUE'),
                    //   ],
                    // ),
                    // _space,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // IconButton(
                        //   icon: const Icon(Icons.skip_previous),
                        //   onPressed: _isPlayerReady
                        //       ? () => _controller.load(_ids[
                        //           (_ids.indexOf(_controller.metadata.videoId) -
                        //                   1) %
                        //               _ids.length])
                        //       : null,
                        // ),
                        // IconButton(
                        //   icon: Icon(
                        //     _controller.value.isPlaying
                        //         ? Icons.pause
                        //         : Icons.play_arrow,
                        //   ),
                        //   onPressed: _isPlayerReady
                        //       ? () {
                        //           _controller.value.isPlaying
                        //               ? _controller.pause()
                        //               : _controller.play();
                        //           setState(() {});
                        //         }
                        //       : null,
                        // ),
                        // IconButton(
                        //   icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                        //   onPressed: _isPlayerReady
                        //       ? () {
                        //           _muted
                        //               ? _controller.unMute()
                        //               : _controller.mute();
                        //           setState(() {
                        //             _muted = !_muted;
                        //           });
                        //         }
                        //       : null,
                        // ),
                        // FullScreenButton(
                        //   controller: _controller,
                        //   color: Colors.blueAccent,
                        // ),
                        // IconButton(
                        //   icon: const Icon(Icons.skip_next),
                        //   onPressed: _isPlayerReady
                        //       ? () => _controller.load(_ids[
                        //           (_ids.indexOf(_controller.metadata.videoId) +
                        //                   1) %
                        //               _ids.length])
                        //       : null,
                        // ),
                      ],
                    ),
                    // _space,
                    const Row(
                      children: <Widget>[
                         Text(
                          "Volume",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        // Expanded(
                        //   child: Slider(
                        //     inactiveColor: Colors.transparent,
                        //     value: _volume,
                        //     min: 0.0,
                        //     max: 100.0,
                        //     divisions: 10,
                        //     label: '${(_volume).round()}',
                        //     onChanged: _isPlayerReady
                        //         ? (value) {
                        //             setState(() {
                        //               _volume = value;
                        //             });
                        //             _controller.setVolume(_volume.round());
                        //           }
                        //         : null,
                        //   ),
                        // ),
                      ],
                    ),
                    // _space,
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        // color: _getStateColor(_playerState),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _playerState.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
         ),
     );
  }
}