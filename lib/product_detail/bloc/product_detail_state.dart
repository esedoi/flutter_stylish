part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {

  final DetailState detailState;
  const ProductDetailState(this.detailState);

  @override
  List<Object> get props => [detailState];
}

class ProductDetailInitial extends ProductDetailState {
  ProductDetailInitial(DetailState detailState) : super(detailState);
}

class ProductDtailChange extends ProductDetailState {
  ProductDtailChange({required DetailState detailState}) : super(detailState);
}
