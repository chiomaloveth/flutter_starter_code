import 'package:flutter/material.dart';
import 'package:nova/core/domain/utils/extensions.dart';
import 'package:nova/core/presentation/shared/styles/text_style.dart';

import 'package:nova/core/presentation/themes/colors.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double? width;
  final double? height;
  final double? radius;
  final Color? bgColor;
  final Color? textColor;
  final bool? isDisabledBorder;
  final bool activeButton;
  final bool loadState;
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.bgColor,
    this.textColor,
    this.isDisabledBorder = true,
    this.width,
    this.height,
    this.radius,
    this.activeButton = true,
    this.loadState = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 344,
      height: height ?? 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border:
            isDisabledBorder == true
                ? null
                : Border.all(width: 1, color: context.colorScheme.surfaceDim),
        borderRadius: BorderRadius.circular(radius ?? 10),
        color:
            activeButton
                ? bgColor ?? context.colorScheme.primary
                : context.colorScheme.primary.withValues(alpha:0.7),
      ),
      child:
          loadState
              ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.kWhite,
                ),
              )
              : TextRegular(
                title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor ?? context.colorScheme.surface,
              ),
    ).onTap(
      onTap:
          activeButton
              ? () {
                FocusScope.of(context).unfocus();
                onTap?.call();
              }
              : () {},
    );
  }
}
