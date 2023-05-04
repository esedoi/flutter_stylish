import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/web_rtc/WebRTC.dart';

import 'home/bloc/home_bloc.dart';
import 'home/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: BlocProvider(
          create: (BuildContext context) => HomeBloc()..add(LoadDataEvent()),
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= 601) {
              return HorizontalView();
            } else {
              return MyHomePage(title: 'webrtc',);
            }
          }),
        )
        );
  }
}

class MyHomePageTap extends StatefulWidget {
  const MyHomePageTap({super.key, required this.title});


  final String title;

  @override
  State<MyHomePageTap> createState() => _MyHomePageStateTap();
}

class _MyHomePageStateTap extends State<MyHomePageTap> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _tappayMessage,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _inputCreditCard,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String _tappayMessage = 'init';

  static const platform = MethodChannel('test_tappay');

  Future<void> _inputCreditCard() async {
    String message;

    try {
      final String result = await platform.invokeMethod('tappay');
      message = result;
    } on PlatformException catch (e) {
      message = e.message ?? '';
    }

    setState(() {
      _tappayMessage = message;
    });
  }
}


