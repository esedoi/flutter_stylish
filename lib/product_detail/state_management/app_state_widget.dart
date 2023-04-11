import 'package:flutter/cupertino.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_widget_state.dart';

import '../../main.dart';

class AppStateWidget extends StatefulWidget {
  final Widget child;
  final ProductItem productItem;

  AppStateWidget({required this.productItem, required this.child, Key? key})
      : super(key: key);

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}