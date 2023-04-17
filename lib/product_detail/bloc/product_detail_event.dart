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

class SetSelectedSizeIndexEvent extends ProductDetailEvent {
  const SetSelectedSizeIndexEvent(this.newSizeIndex);

  final int newSizeIndex;

  @override
  List<Object> get props => [newSizeIndex];
}

class SetQuantityEvent extends ProductDetailEvent {
  const SetQuantityEvent(this.newQuantity);

  final int newQuantity;

  @override
  List<Object> get props => [newQuantity];
}
