
import 'package:equatable/equatable.dart';

import '../../data/data_class.dart';


class DetailState extends  Equatable {
  DetailState(
      {this.quantity = 1,
      this.selectedColorIndex = 0,
      this.selectedSizeIndex = 0,
      this.availableSizes = const <SizeOption>[],
      this.maxQuantity = 1,
      this.selectedColor="",
      this.selectedSize="",
    });

  int quantity = 1;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  List<SizeOption> availableSizes;
  int maxQuantity;
  String selectedColor = "";
  String selectedSize = "";
  

  DetailState copyWith({
    int? quantity,
    int? selectedColorIndex,
    int? selectedSizeIndex,
    List<SizeOption>? availableSizes,
    int? maxQuantity,
    String? selectedColor,
    String? selectedSize,
  }) {
    return DetailState(
        quantity: quantity ?? this.quantity,
        selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
        selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
        availableSizes: availableSizes ?? this.availableSizes,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize
        );
  }
  
  @override
  List<Object?> get props => [quantity, selectedColorIndex, selectedSizeIndex,availableSizes,maxQuantity, selectedColor, selectedSize ];
}