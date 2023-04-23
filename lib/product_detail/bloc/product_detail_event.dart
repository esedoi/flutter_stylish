part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class SetSelectedColorIndexEvent extends ProductDetailEvent {
  const SetSelectedColorIndexEvent(this.newColorIndex);

  final int newColorIndex;

  @override
  List<Object> get props => [newColorIndex];
}

class SetSelectedColorEvent extends ProductDetailEvent {
  const SetSelectedColorEvent(this.newColor);

  final String newColor;

  @override
  List<Object> get props => [newColor];
}

class SetSelectedSizeIndexEvent extends ProductDetailEvent {
  const SetSelectedSizeIndexEvent(this.newSizeIndex);

  final int newSizeIndex;

  @override
  List<Object> get props => [newSizeIndex];
}

class SetSelectedSizeEvent extends ProductDetailEvent {
  const SetSelectedSizeEvent(this.newSize);

  final String newSize;

  @override
  List<Object> get props => [newSize];
}

class SetQuantityEvent extends ProductDetailEvent {
  const SetQuantityEvent(this.newQuantity);

  final int newQuantity;

  @override
  List<Object> get props => [newQuantity];
}
