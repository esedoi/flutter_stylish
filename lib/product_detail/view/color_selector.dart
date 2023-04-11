import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_scope.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_widget.dart';

import '../../main.dart';
import 'detail_page.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductItem productItem = AppStateScope.of(context).productItem;
    return Container(
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
          Wrap(
            spacing: 8,
            children: List<Widget>.generate(
              productItem.colorOption.length,
              (index) {
                Color color = productItem.colorOption[index].color;
                return GestureDetector(
                  onTap: () {
                    AppStateWidget.of(context).setSelectedColorIndex(index);
                    AppStateWidget.of(context).setSelectedSizeIndex(0);
                    AppStateWidget.of(context).setQuantity(1);
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(
                        color: AppStateScope.of(context).selectedColorIndex ==
                                index
                            ? Colors.red
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}