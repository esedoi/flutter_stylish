import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
//git test

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  bool isCaller = false;

  bool _isConnecting = false; // 新增一個標誌表示是否正在建立連接

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
    _channel = IOWebSocketChannel.connect('ws://192.168.20.98:8080');
    _channel.stream.listen((event) {
      final message = jsonDecode(event);
      switch (message['type']) {
        case 'init':
          isCaller = message['isCaller']; // 根據從服務器接收到的消息設置角色
          if (isCaller) {
            _createOffer(); // 如果客戶端是caller，則主動創建offer
          }
          break;
        case 'offer':
          if (!isCaller) {
            // 只有當客戶端不是caller時，才處理接收到的offer
            _handleOfferReceived(message['description']);
          }
          break;
        case 'answer':
          if (isCaller) {
            // 只有當客戶端是caller時，才處理接收到的answer
            _handleAnswerReceived(message['description']);
          }
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

    setState(() {});
  }

//第四步：創建本地流

  _createStream() async {
    MediaStream stream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': {
        'facingMode': 'user',
      },
    });
    print('Video tracks: ${stream.getVideoTracks().length}');

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

    MediaStream stream = await _createStream();
    // 添加音頻和視頻軌道
    stream.getAudioTracks().forEach((track) {
      peerConnection.addTrack(track, stream);
    });
    stream.getVideoTracks().forEach((track) {
      peerConnection.addTrack(track, stream);
    });

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
        setState(() {
          _remoteRenderer.srcObject = event.streams[0];
        });
        // _remoteRenderer.srcObject = event.streams[0];
      }
    };

    _peerConnection!.onRemoveStream = (stream) {
      _remoteRenderer.srcObject = null;
    };

    return _peerConnection;
  }

// 第七步：創建 Offer
  _createOffer() async {
    if (_isConnecting) return; // 如果正在建立連接，則返回

    _isConnecting = true; // 設置標誌為true，表示正在建立連接

    setState(() {}); // 更新UI

    final peerConnection = await _setupPeerConnection();

    final offer = await peerConnection.createOffer();

    await peerConnection.setLocalDescription(offer);

    _channel.sink.add(jsonEncode({
      'type': 'offer',
      'description': offer.toMap(),
    }));

    // 在成功建立連接後，將標誌設置回false並更新UI
    _isConnecting = false;
    setState(() {});

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

  _disconnect() async {
    if (_peerConnection != null) {
      await _peerConnection!.close();
      _peerConnection = null;
    }

    if (_localRenderer.srcObject != null) {
      _localRenderer.srcObject!.getTracks().forEach((track) => track.stop());
      _localRenderer.srcObject = null;
    }

    if (_remoteRenderer.srcObject != null) {
      _remoteRenderer.srcObject = null;
    }
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
  onPressed: isCaller ? _createOffer : null,
  child: Text('Start WebRTC Connection as Caller'),
),
            ElevatedButton(
              onPressed: _disconnect,
              child: Text('Disconnect WebRTC Connection'),
            ),
          ],
        ),
      ),
    );
  }
}
