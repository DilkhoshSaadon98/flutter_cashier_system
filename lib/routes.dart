import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/middleware/mymiddleware.dart';
import 'package:cashier_system/view/Settings/BackUp_screen.dart';
import 'package:cashier_system/view/Settings/Update_Screen.dart';
import 'package:cashier_system/view/Settings/change_userName_password.dart';
import 'package:cashier_system/view/cashier/cashier_screen.dart';
import 'package:cashier_system/view/categories/catagories_screen.dart';
import 'package:cashier_system/view/categories/components/edit_categories_screen.dart';
import 'package:cashier_system/view/categories/components/add_categories_screen.dart';
import 'package:cashier_system/view/home/home_screen.dart';
import 'package:cashier_system/view/import_export/import_export_screen.dart';
import 'package:cashier_system/view/inventory/inventory_screen.dart';
import 'package:cashier_system/view/items/components/items_add_screen.dart';
import 'package:cashier_system/view/items/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //! Start Root :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: "/",
      page: () => HomeScreen(),
      middlewares: [MyMiddleWare()]),

  //!  Home Roots :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.homeScreen,
      page: () => const HomeScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.cashierScreen,
      page: () => const CashierScreen()),
  GetPage(
      
      transition: Transition.fadeIn,
      curve: Curves.easeInOutBack,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.catagoriesScreen,
      page: () => const CatagoriesScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.inventoryScreen,
      page: () => const InventoryScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.importExportScreen,
      page: () => const ImportExportScreen()),
  GetPage(
      transition: Transition.fadeIn,
      curve: Curves.easeInOutBack,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.itemsScreen,
      page: () => const ItemsScreen()),
  //! Settings Routes
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.updateScreen,
      page: () => const UpdateScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.backUpScreen,
      page: () => const BackupScreen()),
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.changeUsernamePassword,
      page: () => const ChangeUsernamePassword()),
  //!Categories Routes:
  GetPage(
      transition: Transition.fadeIn,
      curve: Curves.easeInOutBack,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.categoriesUpdateScreen,
      page: () => const EditCatagories()),
  GetPage(
      transition: Transition.fadeIn,
      curve: Curves.easeInOutBack,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.categoriesAddScreen,
      page: () => const AddCategoriesScreen()),
  //!Items Routes:
  GetPage(
      transition: Transition.fadeIn,
      curve: Curves.easeInOutBack,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.itemsUpdateScreen,
      page: () => const EditCatagories()),
  GetPage(
      transition: Transition.fadeIn,
      curve: Curves.easeInOutBack,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.itemsAddScreen,
      page: () => const ItemsAddScreen()),
];
