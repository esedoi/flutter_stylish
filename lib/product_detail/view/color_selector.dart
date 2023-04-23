import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_obj.dart';
import '../bloc/product_detail_bloc.dart';

class ColorSelector extends StatelessWidget {
  final Product product;
  const ColorSelector({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            '顏色',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          VerticalDivider(
            color: Colors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (context, state) {
            return Wrap(
              spacing: 8,
              children: List<Widget>.generate(
                product.colors!.length,
                (index) {
                  String code = product.colors![index]['code'];
                  Color color = hexToColor(code);
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<ProductDetailBloc>()
                          .add(SetSelectedColorEvent(code));
                      context
                          .read<ProductDetailBloc>()
                          .add(SetSelectedSizeIndexEvent(0));
                      context
                          .read<ProductDetailBloc>()
                          .add(SetQuantityEvent(1));
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(
                          color: state.detailState.selectedColor == code
                              ? Colors.red
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}

Color hexToColor(String hexString) {
  String hex = hexString.toUpperCase().replaceAll("#", "");
  if (hex.length == 6) {
    hex = "FF" + hex;
  }
  return Color(int.parse(hex, radix: 16));
}
