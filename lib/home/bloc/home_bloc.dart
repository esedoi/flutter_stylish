import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stylish/model/collection.dart';
import 'package:flutter_stylish/model/product_response.dart';

import '../../http_service/http_service.dart';
import '../../model/hots_response.dart';
import '../../model/product_obj.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(DataLoadingState()) {
    on<LoadDataEvent>(_loadApi);
  }

  Future<void> _loadApi(LoadDataEvent event, Emitter<HomeState> emit) async {
    await _getData(event, emit);

    // await _getProducts(event, emit);
  }

  Future<void> _getData(
    LoadDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(DataLoadingState());
    try {
      String hostName = 'api.appworks-school.tw';
      String apiVersion = '1.0';

      final dio = Dio();
      List<Collection>? collections;

      final response =
          await dio.get('https://$hostName/api/$apiVersion/marketing/hots');
      final data = response.data;

      collections = HotsResponse.fromJson(data).data;

      List<Product> hotProducts = [];
      List<Product> menProducts = [];
      List<Product> womenProducts = [];
      List<Product> accessoriesProducts = [];

      for (Collection collection in collections!) {
        hotProducts.addAll(collection.products ?? []);
      }

      final womenProductsResponse =
          await dio.get('https://$hostName/api/$apiVersion/products/women');
      final womenProductsResponseData =
          ProductResponse.fromJson(womenProductsResponse.data).data;

      final menProductsResponse =
          await dio.get('https://$hostName/api/$apiVersion/products/men');
      final menProductsResponseData =
          ProductResponse.fromJson(menProductsResponse.data).data;

      final accessoriesProductsResponse =
          await dio.get('https://$hostName/api/$apiVersion/products/accessories');
      final accessoriesProductsResponseData =
          ProductResponse.fromJson(accessoriesProductsResponse.data).data;



      emit(DataLoadedState(
          hotProducts: hotProducts,
          menProducts: menProductsResponseData!,
          womenProducts: womenProductsResponseData!,
          accessoriesProducts: accessoriesProductsResponseData!));
    } catch (e) {

      // emit(CatalogError());
    }
  }

  // Future<void> _getProducts(
  //   LoadDataEvent event,
  //   Emitter<HomeState> emit,
  // ) async {
  //   print('HomeBloc, 50');
  //   emit(DataLoadingState());
  //   try {
  //     print('HomeBloc, 59');
  //     String hostName = 'api.appworks-school.tw';
  //     String apiVersion = '1.0';

  //     final dio = Dio();

  //     List<Product> products;

  //     final response =
  //         await dio.get('https://$hostName/api/$apiVersion/products/all');
  //     final data = ProductResponse.fromJson(response.data);
  //     print('68, ${data.data}');

  //     emit(ProductsLoadedState(products: data.data!));
  //   } catch (e) {
  //     print('HomeBloc, 72, ${e.toString()}');
  //     // emit(CatalogError());
  //   }
  // }

  // HttpService http;

//   SingleUserResponse singleUserResponse;
//   User user;

//   bool isLoading = false;

// Future getProductsAll() async {
//     Response response;
//     try {
//       isLoading = true;

//       response = await http.getRequest("/products/all");

//       isLoading = false;

//       if (response.statusCode == 200) {
//         setState(() {
//           singleUserResponse = SingleUserResponse.fromJson(response.data);
//           user = singleUserResponse.user;
//         });
//       } else {
//         print("There is some problem status code not 200");
//       }
//     } on Exception catch (e) {
//       isLoading = false;
//       print(e);
//     }
//   }
}
