part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];

  
}

class HomeInitial extends HomeState {}

class DataLoadingState extends HomeState{}

class DataLoadedState extends HomeState {
  

  final List<Product> hotProducts ;
  final List<Product> menProducts ;
  final List<Product> womenProducts;
  final List<Product> accessoriesProducts;

  DataLoadedState( {required this.hotProducts,required this.menProducts, required this.womenProducts,required  this.accessoriesProducts, } );

  @override
  List<Object> get props => [hotProducts, menProducts,womenProducts, accessoriesProducts ];
}


class DataErrorState extends HomeState {
  final String error;

  DataErrorState({required this.error});
}