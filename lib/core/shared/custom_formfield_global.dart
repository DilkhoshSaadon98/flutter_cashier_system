import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/core/responsive/responisve_text_body.dart';
import 'package:cashier_system/core/responsive/responsive_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomTextFormFieldGlobal extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  Color? borderColor;
  TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? readOnly;
  final bool? obscureText;
  final bool? capitalizeText;
  final void Function(String)? onChanged;
  final void Function()? onTapIcon;

  CustomTextFormFieldGlobal(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.readOnly,
      this.capitalizeText,
      this.onChanged,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        textCapitalization: capitalizeText == true
            ? TextCapitalization.sentences
            : TextCapitalization.none,
        validator: valid,
        textInputAction: TextInputAction.next,
        textAlignVertical: TextAlignVertical.center,
        keyboardType:
            isNumber == true ? TextInputType.phone : TextInputType.text,
        controller: mycontroller,
        style: titleStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: responsivefontSize(Get.width),
            color: borderColor ?? thirdColor),
        textAlign: TextAlign.start,
        readOnly: readOnly ?? false,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hinttext.tr,
          hintStyle: bodyStyle.copyWith(
              fontSize: responsivefontSize(Get.width),
              color: borderColor ?? thirdColor),
          alignLabelWithHint: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          label: Text(
            labeltext.tr,
            style: titleStyle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: responsivefontSize(Get.width),
                color: borderColor ?? thirdColor),
          ),
          prefixIcon: Icon(
            iconData,
            color: borderColor ?? thirdColor,
            size: responsiveIconSize(Get.width),
          ),
          hintFadeDuration: const Duration(milliseconds: 500),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: secondColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: thirdColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: secondColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
        ),
      ),
    );
  }
}
