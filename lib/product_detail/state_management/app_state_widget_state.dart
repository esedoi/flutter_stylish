import 'package:flutter/cupertino.dart';

import '../../main.dart';
import 'app_state.dart';
import 'app_state_scope.dart';
import 'app_state_widget.dart';

class AppStateWidgetState extends State<AppStateWidget> {
  int quantity = 1;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  List<SizeOption> get availableSizes {
    return widget.productItem.colorOption[selectedColorIndex].sizeOptions
        .where((sizeOption) => sizeOption.stock > 0)
        .toList();
  }

  int get maxQuantity {
    return availableSizes.isNotEmpty
        ? availableSizes[selectedSizeIndex].stock
        : 0;
  }

   late AppState _data ;

  void setSelectedColorIndex(int newColorIndex) {
    if (newColorIndex != _data.selectedColorIndex) {
      setState(() {
        _data = _data.copyWith(
          selectedColorIndex: newColorIndex,
        );
      });
    }
  }

  void setSelectedSizeIndex(int newSizeIndex) {
    if (newSizeIndex != _data.selectedSizeIndex) {
      setState(() {
        _data = _data.copyWith(
          selectedSizeIndex: newSizeIndex,
        );
      });
    }
  }

  void setQuantity(int newQuantity) {
    if (newQuantity != _data.quantity) {
      setState(() {
        _data = _data.copyWith(quantity: newQuantity);
      });
    }
  }


  @override
  void initState() {
    _data = AppState(
        quantity: quantity,
        selectedColorIndex: selectedColorIndex,
        selectedSizeIndex: selectedSizeIndex,
        availableSizes: availableSizes,
        maxQuantity: maxQuantity,
        productItem: widget.productItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }
}