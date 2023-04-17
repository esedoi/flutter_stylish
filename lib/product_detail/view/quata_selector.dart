import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_class.dart';
import '../bloc/product_detail_bloc.dart';

class QuataSelector extends StatelessWidget {
  final ProductItem productItem;
  const QuataSelector({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ProductItem productItem = AppStateScope.of(context).productItem;
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
                ColorOption colorOption = productItem
                    .colorOption[state.detailState.selectedColorIndex];
                    
                SizeOption sizeOption = colorOption
                    .sizeOptions[state.detailState.selectedSizeIndex];

                if (state.detailState.quantity < sizeOption.stock) {
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
