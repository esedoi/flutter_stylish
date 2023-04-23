import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_class.dart';
import '../../model/product_obj.dart';
import '../../model/variant_obj.dart';
import '../bloc/product_detail_bloc.dart';

class QuataSelector extends StatelessWidget {
  final Product product;
  const QuataSelector({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
        return Row(
          children: [
            Text(
              '數量',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: () {
                if (state.detailState.quantity > 1) {
                  context
                      .read<ProductDetailBloc>()
                      .add(SetQuantityEvent(state.detailState.quantity - 1));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              '${state.detailState.quantity}',
            ),
            SizedBox(
              width: 16,
            ),
            InkWell(
              onTap: () {
                int getStock(List<Variant> variants, String selectedColor,
                    String selectedSize) {
                  for (var variant in variants) {
                    if (variant.colorCode == selectedColor &&
                        variant.size == selectedSize) {
                      return variant.stock ?? 0;
                    }
                  }
                  return 0;
                }

                if (state.detailState.quantity <
                    getStock(product.variants!, 
                    state.detailState.selectedColor,
                        state.detailState.selectedSize)) {
                  context
                      .read<ProductDetailBloc>()
                      .add(SetQuantityEvent(state.detailState.quantity + 1));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
