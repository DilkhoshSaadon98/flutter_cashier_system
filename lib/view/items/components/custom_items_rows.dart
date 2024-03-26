import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/formating_numbers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomItemsTableRows extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var dataItem;
  final Color color;
  CustomItemsTableRows({super.key, this.dataItem, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: .3, color: primaryColor)),
              child: Text(
                textAlign: TextAlign.center,
                "${int.parse(dataItem.itemsId.toString()) + 1000}",
                style: bodyStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: .3, color: primaryColor)),
              child: Text(
                textAlign: TextAlign.center,
                dataItem.itemsBarcode.toString(),
                style: bodyStyle,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: .3, color: primaryColor)),
              child: Text(
                textAlign: TextAlign.center,
                dataItem.itemsName.toString(),
                style: bodyStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: .3, color: primaryColor)),
              child: Text(
                textAlign: TextAlign.center,
                dataItem.itemsCount.toString(),
                style: bodyStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: .3, color: primaryColor)),
                child: Text(
                    textAlign: TextAlign.center,
                    formattingNumbers(
                        int.parse(dataItem.itemsSellingprice.toString())))),
          ),
          Expanded(
            child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: .3, color: primaryColor)),
                child: Text(
                    textAlign: TextAlign.center,
                    formattingNumbers(
                        int.parse(dataItem.itemsBuingprice.toString())))),
          ),
          Expanded(
            child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: .3, color: primaryColor)),
                child: Text(
                    textAlign: TextAlign.center,
                    formattingNumbers(
                        int.parse(dataItem.itemsCostprice.toString())))),
          ),
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: .3, color: primaryColor)),
              child: Text(
                textAlign: TextAlign.center,
                dataItem.itemsType.toString(),
                style: bodyStyle,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: .3, color: primaryColor)),
              child: Text(
                textAlign: TextAlign.center,
                dataItem.itemsCat.toString(),
                style: bodyStyle,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: .3, color: primaryColor)),
              child: Text(
                textAlign: TextAlign.center,
                dataItem.itemsDesc.toString(),
                style: bodyStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
