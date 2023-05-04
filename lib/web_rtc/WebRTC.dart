import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCDemo extends StatefulWidget {
  @override
  _WebRTCDemoState createState() => _WebRTCDemoState();
}

class _WebRTCDemoState extends State<WebRTCDemo> {
  MediaStream _localStream;

  @override
  void initState() {
    super.initState();
    _getUserMedia().then((stream) {
      setState(() {
        _localStream = stream;
      });
    });
  }

  Future<MediaStream> _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'facingMode': 'user',
        'width': 640,
        'height': 480,
      }
    };

    final MediaStream stream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);
    return stream;
  }

  @override
  void dispose() {
    _localStream?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebRTC Demo'),
      ),
      body: Center(
        child: _localStream == null
            ? CircularProgressIndicator()
            : RTCVideoView(
                RTCVideoRenderer(
                  srcObject: _localStream,
                ),
                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              ),
      ),
    );
  }
}