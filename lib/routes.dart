import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/middleware/mymiddleware.dart';
import 'package:cashier_system/view/Settings/BackUp_screen.dart';
import 'package:cashier_system/view/Settings/Update_Screen.dart';
import 'package:cashier_system/view/Settings/change_userName_password.dart';
import 'package:cashier_system/view/cashier/cashier_screen.dart';
import 'package:cashier_system/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //! Start Root :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: "/",
      page: () => UpdateScreen(),
      middlewares: [MyMiddleWare()]),

  //!  Auth Roots :
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
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.backUpScreen,
      page: () => const BackupScreen()),
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
      name: AppRoute.changeUsernamePassword,
      page: () => const ChangeUsernamePassword()),
];
