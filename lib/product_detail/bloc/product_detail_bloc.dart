import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state.dart';

import '../../data/data_class.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(this.productItem)
      : _data = DetailState(),
        super(ProductDetailInitial(DetailState())) {
    on<SetSelectedColorIndexEvent>(_onColorSelected);
  }

  final ProductItem productItem;
  final DetailState _data;

  int quantity = 1;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  List<SizeOption> get availableSizes {
    return productItem.colorOption[selectedColorIndex].sizeOptions
        .where((sizeOption) => sizeOption.stock > 0)
        .toList();
  }

  int get maxQuantity {
    return availableSizes.isNotEmpty
        ? availableSizes[selectedSizeIndex].stock
        : 0;
  }

  void _onColorSelected(
      SetSelectedColorIndexEvent event, Emitter<ProductDetailState> emit) {
    try {
      emit(
        ProductDtailChange(
          detailState: _data.copyWith(selectedColorIndex: event.newColorIndex),
        ),
      );
    } catch (_) {}
  }
}
