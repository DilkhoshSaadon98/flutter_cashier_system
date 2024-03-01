import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_TextField extends StatelessWidget {
  TextEditingController controller;
  String title;
  bool? isPassword;

  Custom_TextField(this.controller, this.title, this.isPassword, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 50.h,
      child: TextFormField(
        validator: (value) {
          //return validInput(value!, 5, 100, title);
        },
        // keyboardType:isPhone == true ? TextInputType.phone : TextInputType.text,
        //  controller: controller,

        textAlign: TextAlign.start,
        // obscureText: title != 'Password' ? false : control.fieldState,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          label: Text(
            title,
          ),
          suffixIcon: isPassword == true
              ? IconButton(
                  onPressed: () {},
                  icon: true == true
                      ? const Icon(
                          Icons.visibility_outlined,
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                        ),
                )
              : null,
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
