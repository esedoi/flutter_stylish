
import 'package:equatable/equatable.dart';

import '../../data/data_class.dart';


class DetailState extends  Equatable {
  DetailState(
      {this.quantity = 1,
      this.selectedColorIndex = 0,
      this.selectedSizeIndex = 0,
      this.availableSizes = const <SizeOption>[],
      this.maxQuantity = 1,
    });

  int quantity = 1;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  List<SizeOption> availableSizes;
  int maxQuantity;
  

  DetailState copyWith({
    int? quantity,
    int? selectedColorIndex,
    int? selectedSizeIndex,
    List<SizeOption>? availableSizes,
    int? maxQuantity,
  }) {
    return DetailState(
        quantity: quantity ?? this.quantity,
        selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
        selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
        availableSizes: availableSizes ?? this.availableSizes,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        );
  }
  
  @override
  List<Object?> get props => [quantity, selectedColorIndex, selectedSizeIndex,availableSizes,maxQuantity ];
}