import 'package:auth_app/app/style/layout/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../style/color/color.dart';

class CustomReactiveFied extends StatelessWidget {
  const CustomReactiveFied(
      {super.key,
      required this.hintText,
      required this.formController,
      required this.validationMessage,
      required this.labal});
  final String formController;
  final String hintText;
  final String validationMessage;
  final String labal;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
        formControlName: formController,
        cursorColor: CustomColor.grey,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            hintText: hintText,
            label: Text(labal),
            counterStyle: const TextStyle(
                backgroundColor: CustomColor.white,
                fontSize: Sizes.s16,
                color: CustomColor.black),
            errorMaxLines: 2,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: CustomColor.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: CustomColor.grey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: CustomColor.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: CustomColor.red))),
        validationMessages: {
          ValidationMessage.required: (error) => validationMessage,
        });
  }
}
