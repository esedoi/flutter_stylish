import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_scope.dart';
import 'package:flutter_stylish/product_detail/state_management/app_state_widget.dart';

import '../../main.dart';
import 'detail_page.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Wrap(
            spacing: 8,
            children: AppStateScope.of(context)
                .availableSizes
                .map(
                  (sizeOption) => ChoiceChip(
                    label: Text(sizeOption.size),
                    selected: AppStateScope.of(context).selectedSizeIndex ==
                        AppStateScope.of(context)
                            .availableSizes
                            .indexOf(sizeOption),
                    onSelected: (isSelected) {
                      AppStateWidget.of(context).setSelectedSizeIndex(
                          AppStateScope.of(context)
                              .availableSizes
                              .indexOf(sizeOption));
                      AppStateWidget.of(context).setQuantity(1);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}