import 'package:auth_app/app/style/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/layout/size.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton(
      {super.key, required this.isloading, required this.label, required this.onTap});
  final bool isloading;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => CustomColor.primary),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.s4),
            ),
          ),
        ),
        child: isloading
            ? const SizedBox(
                height: Sizes.s28,
                width: Sizes.s28,
                child: Center(
                  child: CircularProgressIndicator(
                    color: CustomColor.white,
                  ),
                ),
              )
            : Text(
                label,
                style: const TextStyle(color: CustomColor.white, fontSize: Sizes.s20),
              ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.text, required this.onTap, required this.icon});
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: CustomColor.primary),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: CustomColor.white,),
              const SizedBox(
                width: 30,
              ),
              Text(
                text,
                style: const TextStyle(color: CustomColor.white, fontSize: Sizes.s20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
