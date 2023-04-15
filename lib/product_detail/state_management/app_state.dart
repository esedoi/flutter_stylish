
import '../../data/data_class.dart';

class AppState {
  AppState(
      {this.quantity = 1,
      this.selectedColorIndex = 1,
      this.selectedSizeIndex = 1,
      this.availableSizes = const <SizeOption>[],
      this.maxQuantity = 0,
      required this.productItem});

  int quantity = 1;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
  List<SizeOption> availableSizes;
  int maxQuantity;
  ProductItem productItem;

  AppState copyWith({
    int? quantity,
    int? selectedColorIndex,
    int? selectedSizeIndex,
    List<SizeOption>? availableSizes,
    int? maxQuantity,
  }) {
    return AppState(
        quantity: quantity ?? this.quantity,
        selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
        selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
        availableSizes: availableSizes ?? this.availableSizes,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        productItem: productItem);
  }
}

class DetailState {
  DetailState(
      {this.quantity = 1,
      this.selectedColorIndex = 1,
      this.selectedSizeIndex = 1,
      this.availableSizes = const <SizeOption>[],
      this.maxQuantity = 0,
    });

  int quantity = 1;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;
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
}