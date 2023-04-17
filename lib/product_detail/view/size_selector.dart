import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/data/data_class.dart';

import '../bloc/product_detail_bloc.dart';

class SizeSelector extends StatelessWidget {
  final ProductItem productItem;

  const SizeSelector({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            '尺寸',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(width: 8),
          BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return Wrap(
                spacing: 8,
                children: productItem
                    .colorOption[state.detailState.selectedColorIndex]
                    .sizeOptions
                    // state.detailState.availableSizes
                    .map(
                      (sizeOption) => ChoiceChip(
                        label: Text(
                          sizeOption.size,
                        ),
                        selected: state.detailState.selectedSizeIndex ==
                            state.detailState.availableSizes
                                .indexOf(sizeOption),
                        onSelected: (isSelected) {
                          context.read<ProductDetailBloc>().add(
                              SetSelectedSizeIndexEvent(state
                                  .detailState.availableSizes
                                  .indexOf(sizeOption)));

                          context
                              .read<ProductDetailBloc>()
                              .add(SetQuantityEvent(1));
                        },
                      ),
                    )
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
