import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state.dart';

import '../../data/data_class.dart';
import '../../model/product_obj.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(this.product)
      : _data = DetailState(
          quantity: 1,
          selectedColorIndex: 0,
          selectedSizeIndex: 0,
        ),
        super(ProductDetailInitial(DetailState(
          quantity: 1,
          selectedColorIndex: 0,
          selectedSizeIndex: 0,
        ))) {
    // on<SetSelectedColorIndexEvent>(_onColorSelected);
    on<SetSelectedColorEvent>(_onColorSelected);
    on<SetSelectedSizeIndexEvent>(_onSelectedSizeIndex);
      on<SetSelectedSizeEvent>(_onSelectedSize);
    on<SetQuantityEvent>(_onSetQuantity);
  }

  final Product product;
  DetailState _data;

  int getmaxQuantity(int selectedSizeIndex, List<SizeOption> availableSizes) {
    return availableSizes.isNotEmpty
        ? availableSizes[selectedSizeIndex].stock
        : 0;
  }

  // List<SizeOption> getAvailableSizes(int selectedColorIndex) {
  //   return product.colorOption[selectedColorIndex].sizeOptions
  //       .where((sizeOption) => sizeOption.stock > 0)
  //       .toList();
  // }

  // void _onColorSelected(
  //     SetSelectedColorIndexEvent event, Emitter<ProductDetailState> emit) {
  //   if (event.newColorIndex == _data.selectedColorIndex) return;
  //   try {
  //     emit(
  //       ProductDtailChange(
  //         detailState: _data = _data.copyWith(
  //             selectedColorIndex: event.newColorIndex,
  //             ),
  //       ),
  //     );
  //   } catch (_) {}
  // }

  void _onColorSelected(
      SetSelectedColorEvent event, Emitter<ProductDetailState> emit) {
    if (event.newColor == _data.selectedColor) return;
    try {
      emit(
        ProductDtailChange(
          detailState: _data = _data.copyWith(
              selectedColor: event.newColor,
              ),
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

  void _onSelectedSize(
      SetSelectedSizeEvent event, Emitter<ProductDetailState> emit) {
    if (event.newSize == _data.selectedSize) return;
    try {
      emit(
        ProductDtailChange(
          detailState: _data = _data.copyWith(
              selectedSize: event.newSize,),
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
