import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state.dart';

import '../../data/data_class.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(this.productItem)
      : _data = DetailState(
          quantity: 1,
          selectedColorIndex: 0,
          selectedSizeIndex: 0,
          availableSizes: productItem.colorOption[0].sizeOptions
              .where((sizeOption) => sizeOption.stock > 0)
              .toList(),
          maxQuantity: productItem.colorOption[0].sizeOptions.isNotEmpty
              ? productItem.colorOption[0].sizeOptions[0].stock
              : 0,
        ),
        super(ProductDetailInitial(DetailState(
          quantity: 1,
          selectedColorIndex: 0,
          selectedSizeIndex: 0,
          availableSizes: productItem.colorOption[0].sizeOptions
              .where((sizeOption) => sizeOption.stock > 0)
              .toList(),
          maxQuantity: productItem.colorOption[0].sizeOptions.isNotEmpty
              ? productItem.colorOption[0].sizeOptions[0].stock
              : 0,
        ))) {
    on<SetSelectedColorIndexEvent>(_onColorSelected);
    on<SetSelectedSizeIndexEvent>(_onSelectedSizeIndex);
    on<SetQuantityEvent>(_onSetQuantity);
  }

  final ProductItem productItem;
  DetailState _data;

  int getmaxQuantity(int selectedSizeIndex, List<SizeOption> availableSizes) {
    return availableSizes.isNotEmpty
        ? availableSizes[selectedSizeIndex].stock
        : 0;
  }

  List<SizeOption> getAvailableSizes(int selectedColorIndex) {
    return productItem.colorOption[selectedColorIndex].sizeOptions
        .where((sizeOption) => sizeOption.stock > 0)
        .toList();
  }

  void _onColorSelected(
      SetSelectedColorIndexEvent event, Emitter<ProductDetailState> emit) {
    if (event.newColorIndex == _data.selectedColorIndex) return;
    try {
      emit(
        ProductDtailChange(
          detailState: _data = _data.copyWith(
              selectedColorIndex: event.newColorIndex,
              availableSizes: getAvailableSizes(event.newColorIndex)),
        ),
      );
    } catch (_) {}
  }

  void _onSelectedSizeIndex(
      SetSelectedSizeIndexEvent event, Emitter<ProductDetailState> emit) {
    if (event.newSizeIndex == _data.selectedSizeIndex) return;
    try {
      emit(
        ProductDtailChange(
          detailState: _data = _data.copyWith(
              selectedSizeIndex: event.newSizeIndex,
              maxQuantity:
                  getmaxQuantity(event.newSizeIndex, _data.availableSizes)),
        ),
      );
    } catch (_) {}
  }

  void _onSetQuantity(
      SetQuantityEvent event, Emitter<ProductDetailState> emit) {
    if (event.newQuantity == _data.quantity) return;
    try {
      emit(
        ProductDtailChange(
          detailState: _data = _data.copyWith(quantity: event.newQuantity),
        ),
      );
    } catch (_) {}
  }
}
