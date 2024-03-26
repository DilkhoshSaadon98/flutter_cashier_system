import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/functions/validinput.dart';
import 'package:cashier_system/core/shared/custom_buttton_global.dart';
import 'package:cashier_system/core/shared/custom_formfield_global.dart';
import 'package:cashier_system/core/shared/custom_sized_box.dart';
import 'package:cashier_system/core/shared/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashierConstantController extends GetxController {
  bool isHover = false;
  Color continerColor = thirdColor;
  List<bool> hoverStates = List.filled(16, false);

  void setHoverState(int index, bool isHovered) {
    hoverStates[index] = isHovered;
    update();
  }

  Map<String, IconData> buttonMap = {
    "Print": Icons.print_outlined,
    "Delay": Icons.pause_outlined,
    "Discount": Icons.discount_outlined,
    "Percent": Icons.percent_outlined,
    "QTY": Icons.layers_outlined,
    "Gift": Icons.card_giftcard_sharp,
    "Delete Item": Icons.delete_outline_outlined,
    "New Bill": Icons.description_outlined,
    "Price": Icons.price_change_outlined,
    "Dept": Icons.money_off,
    "Export": Icons.import_export_outlined,
    "Cash/Dept": Icons.attach_money_sharp,
    "Name": Icons.person_3_outlined,
    "Cash Back/Cash": Icons.money,
  };
  // List<Color> buttonColor = [
  //   Color(0xff279EFF),
  //   Color(0xffFFAF45),
  //   Color(0xff9BCF53),
  //   Color(0xff9BCF53),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  //   Color(0xff00FF00),
  // ];
  List<void Function(String itemid, [String? itemsCount, String? cartNumber])>
      myFunctions = [
    // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Print Function:
      print('Function 1 called with parameter: $parameter');
    },
    //? Done
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Delay Function
      CashierController cashierController = Get.put(CashierController());
      cashierController.delayCart();
    },
    //?Done
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Discount Function
      TextEditingController? discountValueController = TextEditingController();
      CashierController cashierController = Get.put(CashierController());
      Get.defaultDialog(
        title: "",
        titleStyle: titleStyle,
        content: Container(
          height: 200,
          width: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Discount Value",
                style: titleStyle.copyWith(fontSize: 20),
              ),
              customSizedBox(25),
              CustomTextFormFieldGlobal(
                  mycontroller: discountValueController,
                  borderColor: primaryColor,
                  hinttext: 'Discount Value',
                  labeltext: '',
                  iconData: Icons.discount_outlined,
                  valid: (value) {
                    return validInput(value!, 1, 10, 'number');
                  },
                  isNumber: true),
              customButtonGlobal(() {
                if (cashierController.selectedRows.isNotEmpty) {
                  cashierController.dicountingItems(
                      cashierController.selectedRows,
                      discountValueController.text);
                  Get.back();
                  cashierController.selectedRows.clear();
                } else {
                  customSnackBar("Error", "Please Select One Row");
                }
              }, 'Confirm', Icons.check, primaryColor, white, 400, 50)
            ],
          ),
        ),
      );
    },
    //? Done
    (String parameter, [String? itemsCount, String? cartNumber]) {
      TextEditingController? discountValueController = TextEditingController();
      CashierController cashierController = Get.put(CashierController());
      Get.defaultDialog(
        title: "",
        titleStyle: titleStyle,
        content: Container(
          height: 200,
          width: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Percent Discount Value",
                style: titleStyle.copyWith(fontSize: 20),
              ),
              customSizedBox(25),
              CustomTextFormFieldGlobal(
                  mycontroller: discountValueController,
                  borderColor: primaryColor,
                  hinttext: 'Discount Percent Value',
                  labeltext: '',
                  iconData: Icons.percent,
                  valid: (value) {
                    return validInput(value!, 1, 10, 'number');
                  },
                  isNumber: true),
              customButtonGlobal(() {
                cashierController
                    .percentDiscounting(discountValueController.text);
                Get.back();
                cashierController.selectedRows.clear();
              }, 'Confirm', Icons.check, primaryColor, white, 400, 50)
            ],
          ),
        ),
      );
    },
    //? Done
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! QTY Function
      TextEditingController? discountValueController = TextEditingController();
      CashierController cashierController = Get.put(CashierController());
      Get.defaultDialog(
        title: "",
        titleStyle: titleStyle,
        content: Container(
          height: 200,
          width: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Percent Discount Value",
                style: titleStyle.copyWith(fontSize: 20),
              ),
              customSizedBox(25),
              CustomTextFormFieldGlobal(
                  mycontroller: discountValueController,
                  borderColor: primaryColor,
                  hinttext: 'Discount Percent Value',
                  labeltext: '',
                  iconData: Icons.percent,
                  valid: (value) {
                    return validInput(value!, 1, 10, 'number');
                  },
                  isNumber: true),
              customButtonGlobal(() {
                if (cashierController.selectedRows.isNotEmpty) {
                  cashierController.updateItemQuantity(
                      cashierController.selectedRows[0],
                      discountValueController.text);
                  Get.back();
                  cashierController.selectedRows.clear();
                } else {
                  customSnackBar("Error", "Please Select One Row");
                }
              }, 'Confirm', Icons.check, primaryColor, white, 400, 50)
            ],
          ),
        ),
      );
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Gift Function

      CashierController cashierController = Get.put(CashierController());
      if (cashierController.selectedRows.isNotEmpty) {
        cashierController.cartItemGift(
          cashierController.selectedRows[0],
        );
        customSnackBar("Success", "Item Maked Gift Success");
        cashierController.selectedRows.clear();
      } else {
        customSnackBar("Error", "Please Select One Row");
      }
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Delete Item
      print('Function 2 called with parameter: $parameter');
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! New Bill Function
      print('Function 2 called with parameter: $parameter');
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Price Function
      print('Function 2 called with parameter: $parameter');
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Dept Function
      print('Function 2 called with parameter: $parameter');
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Export Function
      print('Function 2 called with parameter: $parameter');
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Cash / Dept
      print('Function 2 called with parameter: $parameter');
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Name Function
      print('Function 2 called with parameter: $parameter');
    }, // TODO:
    (String parameter, [String? itemsCount, String? cartNumber]) {
      //! Cash BAck / Cash
      print('Function 2 called with parameter: $parameter');
    },
  ];
//!! Side Button Functions:

  @override
  void onInit() {
    super.onInit();
  }
}
