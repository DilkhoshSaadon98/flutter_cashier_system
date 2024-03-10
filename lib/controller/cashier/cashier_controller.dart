import 'package:cashier_system/controller/cashier/cashier_constant_controller.dart';

class CashierController extends CashierConstantController {
  
  @override
  void onInit() {
    cashierFunctions = [
      cashierPrintFunction,
      cashierDelayFunction,
      cashierDiscountFunction,
      cashierPercentFunction,
      cashierQTYFunction,
      cashierGiftFunction,
      cashierDollarDinarFunction,
      cashierCashFunction,
      cashierDeleteItemFunction,
      cashierNewBillFunction,
      cashierPriceFunction,
      cashierDeptFunction,
      cashierImportFunction,
      cashierCashDeptFunction,
      cashierNameFunction,
      cashierCashBackCashFunction,
    ];
    super.onInit();
  }
}
