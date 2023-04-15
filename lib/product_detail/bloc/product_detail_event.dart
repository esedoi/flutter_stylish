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
