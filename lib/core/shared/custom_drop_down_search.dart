import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final List<SelectedListItem> listData;
//  final TextEditingController contrllerName;
  // final TextEditingController contrllerId;

  const CustomDropDownSearch(
      {super.key,
      this.title,
      required this.listData,
      //  required this.contrllerName,
      // required this.contrllerId,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        // controller: contrllerName,
        cursorColor: white,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropDownList(context);
        },
        style: titleStyle.copyWith(
            color: white, fontWeight: FontWeight.w100, fontSize: 15),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          label: Text(
            title!,
            style: titleStyle.copyWith(
                color: white, fontWeight: FontWeight.w100, fontSize: 15),
          ),
          // hintText: contrllerName.text == "" ? title : contrllerName.text,
          hintText: "From",
          prefixIcon: Icon(
            iconData,
            color: white,
          ),
          suffixIcon: const Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: white,
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: secondColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: thirdColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
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
        // selectedItems: (List<dynamic> selectedList) {
        //SelectedListItem selectedListItem = selectedList[0];
        // contrllerName.text = selectedListItem.name;
        // contrllerId.text = selectedListItem.value!;
        //  showSnackBar(list.toString());
        // },
      ),
    ).showModal(context);
  }
}
