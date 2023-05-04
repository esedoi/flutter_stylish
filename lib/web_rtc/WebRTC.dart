
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  
  late WebSocketChannel _channel;
  RTCPeerConnection? _peerConnection;


  @override
  void initState() {
    super.initState();
    _initRenderers();
    _initWebSocket();
  }

  @override
  void dispose() {
    super.dispose();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    _channel.sink.close();
  }

  void _initWebSocket() {
  _channel = IOWebSocketChannel.connect('ws://192.168.182.98:8080');
  _channel.stream.listen((event) {
    final message = jsonDecode(event);
    switch (message['type']) {
      case 'offer':
        _handleOfferReceived(message['description']);
        break;
      case 'answer':
        _handleAnswerReceived(message['description']);
        break;
      case 'candidate':
        _handleIceCandidateReceived(message['candidate']);
        break;
      default:
        break;
    }
  });
}

  _initRenderers() async {
    _localRenderer = RTCVideoRenderer();
    await _localRenderer.initialize();
    _remoteRenderer = RTCVideoRenderer();
    await _remoteRenderer.initialize();

   
     setState(() {

     }); 
  }

  

//第四步：創建本地流


  _createStream() async {
  MediaStream stream = await navigator.mediaDevices.getUserMedia({
    'audio': true,
    'video': {
      'facingMode': 'user',
    },
  });

  _localRenderer.srcObject = stream;

  return stream;
}

// 第五步：創建 PeerConnection
_createPeerConnection() async {
  const configuration = {
    'iceServers': [
      {
        'urls': ['stun:stun.l.google.com:19302']
      }
    ]
  };

  final peerConnection =
      await createPeerConnection(configuration, <String, dynamic>{});

  peerConnection.addTrack(await _createStream());

  return peerConnection;
}





// // 第六步：設置事件監聽器


_setupPeerConnection() async {
  if (_peerConnection != null) {
    return _peerConnection;
  }

  _peerConnection = await _createPeerConnection();

  _peerConnection!.onIceCandidate = (candidate) {
    if (candidate != null) {
  _channel.sink.add(jsonEncode({
    'type': 'candidate',
    'candidate': {
      'candidate': candidate.candidate,
      'sdpMid': candidate.sdpMid,
      'sdpMLineIndex': candidate.sdpMLineIndex,
    },
  }));
}
  };

  _peerConnection!.onTrack = (event) {
    if (event.track.kind == 'video') {
      _remoteRenderer.srcObject = event.streams[0];
    }
  }; 

  _peerConnection!.onRemoveStream = (stream) {
    _remoteRenderer.srcObject = null;
  };

  return _peerConnection;
}

// 第七步：創建 Offer
_createOffer() async {
  final peerConnection = await _setupPeerConnection();

  final offer = await peerConnection.createOffer();

  await peerConnection.setLocalDescription(offer);

  
  
  _channel.sink.add(jsonEncode({
    'type': 'offer',
    'description': offer.toMap(),
  }));

  // Send offer to remote peer
}



_handleAnswerReceived(Map<String, dynamic> description) async {
  final peerConnection = await _setupPeerConnection();
  await peerConnection.setRemoteDescription(
    RTCSessionDescription(description['sdp'], description['type']),
  );
}

_handleOfferReceived(Map<String, dynamic> description) async {
  final peerConnection = await _setupPeerConnection();
  await peerConnection.setRemoteDescription(
    RTCSessionDescription(description['sdp'], description['type']),
  );

  final answer = await peerConnection.createAnswer();
  await peerConnection.setLocalDescription(answer);

  _channel.sink.add(jsonEncode({
    'type': 'answer',
    'description': answer.toMap(),
  }));
}

_handleIceCandidateReceived(Map<String, dynamic> candidateMap) async {
  final candidate = RTCIceCandidate(
    candidateMap['candidate'],
    candidateMap['sdpMid'],
    candidateMap['sdpMlineIndex'],
  );

  final peerConnection = await _setupPeerConnection();
  await peerConnection.addCandidate(candidate);
}

_createConnection() async {
  final offer = await _createOffer();

  // Send offer to remote peer

  // Wait for and handle answer from remote peer

  // Wait for and handle ICE candidates from remote peer
}




@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  key: Key('local'),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black),
                  // Set a specific width and height for the local video renderer
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: RTCVideoView(_localRenderer),
                ),
              ),
              Expanded(
                child: Container(
                  key: Key('remote'),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black),
                  // Set a specific width and height for the remote video renderer
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: RTCVideoView(_remoteRenderer),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _createOffer,
            child: Text('Start WebRTC Connection'),
          ),
        ],
      ),
    ),
  );
}

}