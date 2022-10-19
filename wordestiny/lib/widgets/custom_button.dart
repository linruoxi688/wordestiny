import 'package:flutter/material.dart';
import 'package:wordestiny/styles/custom_colors.dart';

class CustomButton extends MaterialButton {
  const CustomButton(
      {Key? key,
      VoidCallback? onPressed,
      Color? color,
      Widget? child,
      Color? textColor,
      EdgeInsets? padding,
      bool? expand})
      : super(
            key: key,
            onPressed: onPressed,
            color: color,
            child: child,
            textColor: textColor,
            shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 0,
            hoverElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            padding: padding,
            minWidth: expand == true ? double.infinity : null);

  factory CustomButton.accent(
          {Key? key,
          VoidCallback? onPressed,
          Widget? child,
          EdgeInsets? padding,
          bool? expand}) =>
      CustomButton(
        key: key,
        onPressed: onPressed,
        color: CustomColors.vi,
        child: child,
        textColor: CustomColors.white,
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        expand: expand ?? true,
      );
}
