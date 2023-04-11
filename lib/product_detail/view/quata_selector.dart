import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_scope.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_widget.dart';

import '../../main.dart';
import 'detail_page.dart';

class QuataSelector extends StatelessWidget {
  const QuataSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductItem productItem = AppStateScope.of(context).productItem;
    return Container(
      height: 50,
      child: Row(
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
              if (AppStateScope.of(context).quantity > 1) {
                AppStateWidget.of(context)
                    .setQuantity(AppStateScope.of(context).quantity-1);
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
            '${AppStateScope.of(context).quantity}',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {
              ColorOption colorOption = productItem
                  .colorOption[AppStateScope.of(context).selectedColorIndex];
              SizeOption sizeOption = colorOption
                  .sizeOptions[AppStateScope.of(context).selectedSizeIndex];

              if (AppStateScope.of(context).quantity < sizeOption.stock) {
                AppStateWidget.of(context)
                    .setQuantity(AppStateScope.of(context).quantity + 1);
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
      ),
    );
  }
}