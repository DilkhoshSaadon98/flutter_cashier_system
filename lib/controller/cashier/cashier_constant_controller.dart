import 'package:cashier_system/controller/cashier/cashier_controller.dart';
import 'package:cashier_system/controller/cashier/cashier_definition_controller.dart';
import 'package:cashier_system/core/shared/custom_cashier_dialog.dart';
import 'package:cashier_system/core/shared/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashierConstantController extends CashierDefinitionController {
  List<Map<String, dynamic>> buttonsDetails = [
    //! Print Function
    {
      'title': "Print",
      'icon': Icons.print_outlined,
      'function': (String parameter,
          [String? itemsCount, String? cartNumber]) {},
      'color': const Color(0xff41C9E2),
    },
    //! Delay Function
    {
      'title': "Delay",
      'icon': Icons.pause_outlined,
      'function': (String parameter, [String? itemsCount, String? cartNumber]) {
        //! Delay Function
        CashierController cashierController = Get.put(CashierController());
        cashierController.delayCart();
      },
      'color': const Color(0xffFFAF45),
    },
    //! Discount Function
    {
      'title': "Discount",
      'icon': Icons.discount_outlined,
      'function': (String parameter, [String? itemsCount, String? cartNumber]) {
        //! Discount Function
        TextEditingController? discountValueController =
            TextEditingController();
        CashierController cashierController = Get.put(CashierController());
        if (cashierController.selectedRows.isNotEmpty) {
          cashierDialog("Discount Value", Icons.local_offer_outlined,
              discountValueController, () {
            cashierController.dicountingItems(
                cashierController.selectedRows, discountValueController.text);
            Get.back();
            cashierController.selectedRows.clear();
            customSnackBar("Success", "Item price updated success");
          });
        } else {
          customSnackBar("Error", "Please select one row at least");
        }
      },
      'color': const Color(0xff9BCF53),
    },
    //! Percent Discount Function:
    {
      'title': "Percent",
      'icon': Icons.percent_outlined,
      'function': (String parameter, [String? itemsCount, String? cartNumber]) {
        TextEditingController? discountValueController =
            TextEditingController();
        CashierController cashierController = Get.put(CashierController());
        if (cashierController.selectedRows.isNotEmpty) {
          cashierDialog(
              "Discount Percent Value", Icons.percent, discountValueController,
              () {
            cashierController.percentDiscounting(discountValueController.text);
            Get.back();
            cashierController.selectedRows.clear();
            customSnackBar("Success", "Item price updated success");
          });
        } else {
          customSnackBar("Error", "Please select one row at least");
        }
      },
      'color': const Color(0xff76ABAE),
    },
    //! QTY Function
    {
      'title': "QTY",
      'icon': Icons.layers,
      'function': (String parameter, [String? itemsCount, String? cartNumber]) {
        TextEditingController? discountValueController =
            TextEditingController();
        CashierController cashierController = Get.put(CashierController());
        if (cashierController.selectedRows.isNotEmpty) {
          cashierDialog("Item QTY", Icons.numbers, discountValueController, () {
            cashierController.updateItemQuantity(
                cashierController.selectedRows[0],
                discountValueController.text);
            Get.back();
            cashierController.selectedRows.clear();
            customSnackBar("Success", "Item price updated success");
          });
        } else {
          customSnackBar("Error", "Please select one row at least");
        }
      },
      'color': const Color(0xff2C7865),
    }, //! Gift Function:
    //! Gift Function
    {
      'title': "Gift",
      'icon': Icons.card_giftcard_outlined,
      'function': (String parameter, [String? itemsCount, String? cartNumber]) {
        CashierController cashierController = Get.put(CashierController());
        if (cashierController.selectedRows.isNotEmpty) {
          cashierController.cartItemGift(
            cashierController.selectedRows[0],
          );
          customSnackBar("Success", "Item Success");
          cashierController.selectedRows.clear();
        } else {
          customSnackBar("Error", "Please select one row at least");
        }
      },
      'color': const Color(0xffD6589F),
    }, //! Delete Items Function
    //! Delete Items Function:
    {
      'title': "Delete Item",
      'icon': Icons.remove_circle_outline_rounded,
      'function': (String parameter, [String? itemsCount, String? cartNumber]) {
        CashierController cashierController = Get.put(CashierController());

        if (cashierController.selectedRows.isNotEmpty) {
          cashierController.deleteCartItem(cashierController.selectedRows[0]);
          customSnackBar("Success", "Item Deleted Success");
          cashierController.selectedRows.clear();
        } else {
          customSnackBar("Error", "Please select one row at least");
        }
      },
      'color': const Color(0xffFF204E),
    }, //!Price Function
    //! Price Function
    {
      'title': "Price",
      'icon': Icons.monetization_on_outlined,
      'function': (String parameter,
          [String? itemsCount, String? cartNumber]) {},
      'color': const Color(0xff279EFF),
    },
    //! Dept Function
    {
      'title': "Dept",
      'icon': Icons.money_off_rounded,
      'function': (String parameter,
          [String? itemsCount, String? cartNumber]) {},
      'color': const Color(0xff279EFF),
    },
    //! Export Function
    {
      'title': "Export",
      'icon': Icons.import_export_rounded,
      'function': (String parameter,
          [String? itemsCount, String? cartNumber]) {},
      'color': const Color(0xff279EFF),
    },
    //! Cash/ Dept Function
    {
      'title': "Cash / Dept",
      'icon': Icons.monetization_on_outlined,
      'function': (String parameter,
          [String? itemsCount, String? cartNumber]) {},
      'color': const Color(0xff279EFF),
    },
    //! Name Function
    {
      'title': "Name",
      'icon': Icons.person,
      'function': (String parameter,
          [String? itemsCount, String? cartNumber]) {},
      'color': const Color(0xff279EFF),
    },
    //! Cashback / Cash Function
    {
      'title': "Cashback / Cash",
      'icon': Icons.money,
      'function': (String parameter,
          [String? itemsCount, String? cartNumber]) {},
      'color': const Color(0xff279EFF),
    },
  ];
  
}
