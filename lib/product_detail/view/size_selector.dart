import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/data/data_class.dart';

import '../../model/product_obj.dart';
import '../bloc/product_detail_bloc.dart';

class SizeSelector extends StatelessWidget {
  final Product product;

  const SizeSelector({Key? key, required this.product}) : super(key: key);

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
                children: product.sizes!

                    // state.detailState.availableSizes
                    .map(
                      (size) => ChoiceChip(
                        label: Text(
                          size,
                        ),
                        selected: state.detailState.selectedSize==
                            size,

                        onSelected: (isSelected) {
                          context.read<ProductDetailBloc>().add(
                              SetSelectedSizeEvent(size
                                  )
                                  );

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
