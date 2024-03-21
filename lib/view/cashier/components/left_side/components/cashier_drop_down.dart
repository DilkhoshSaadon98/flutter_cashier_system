import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashierDropDownSearch extends GetView<CashierController> {
  final String? title;
  final IconData? iconData;
  final List<SelectedListItem> listData;
  final TextEditingController contrllerName;
  final TextEditingController contrllerId;

  const CashierDropDownSearch(
      {super.key,
      this.title,
      required this.listData,
      required this.contrllerName,
      required this.contrllerId,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: TextFormField(
        controller: contrllerName,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropDownList(context);
        },
        style: titleStyle.copyWith(
            color: primaryColor, fontWeight: FontWeight.w100, fontSize: 13),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          label: Text(
            title!,
            style: titleStyle.copyWith(
                fontWeight: FontWeight.w400, fontSize: 13, color: primaryColor),
          ),
          hintText: contrllerName.text == "" ? title : contrllerName.text,
          prefixIcon: Icon(
            iconData,
            color: primaryColor,
          ),
          suffixIcon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: primaryColor,
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: secondColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: thirdColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
        ),
      ),
    );
  }

  void showDropDownList(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(title!, style: titleStyle),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: listData,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          contrllerName.text = selectedListItem.name;
          contrllerId.text = selectedListItem.value!;
          controller.addItemsToCart(contrllerId.text,"1");
          //  showSnackBar(list.toString());
        },
      ),
    ).showModal(context);
  }
}
