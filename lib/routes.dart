import 'package:cashier_system/core/constant/routes.dart';
import 'package:cashier_system/core/middleware/mymiddleware.dart';
import 'package:cashier_system/view/Settings/change_userName_Password/change_userName_password.dart';
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
      page: () => const ChangeUsernamePassword(),
      middlewares: [MyMiddleWare()]),

  //!  Auth Roots :
  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.homeScreen,
      page: () => Text('data')),

  GetPage(
      transition: Transition.leftToRight,
      curve: Curves.decelerate,
      transitionDuration: const Duration(milliseconds: 500),
      name: AppRoute.ChangeUsernamePassword,
      page: () => const ChangeUsernamePassword()),
];
