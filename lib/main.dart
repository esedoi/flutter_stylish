import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/bloc/home_bloc.dart';
import 'home/home.dart';

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
          child: LayoutBuilder(builder: (context, Constraints) {
            if (Constraints.maxWidth >= 601) {
              return HorizontalView();
            } else {
              return VerticalView();
            }
          }),
        ));
  }
}
