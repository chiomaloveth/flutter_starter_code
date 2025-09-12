import 'package:flutter/material.dart';
import 'package:nova/core/presentation/themes/colors.dart';


class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.size,
    this.foregroundColor,
    this.semanticsId,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.fontSize,
  }) : style = TextButtonStyle.normal;

  const AppTextButton.bold({
    required this.label,
    required this.onPressed,
    super.key,
    this.size,
    this.foregroundColor,
    this.semanticsId,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.fontSize,
  }) : style = TextButtonStyle.bold;

  const AppTextButton.link({
    required this.label,
    required this.onPressed,
    super.key,
    this.size,
    this.foregroundColor,
    this.semanticsId,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.fontSize,
  }) : style = TextButtonStyle.link;

  final String label;
  final void Function()? onPressed;
  final TextButtonStyle style;
  final Size? size;
  final Color? foregroundColor;
  final String? semanticsId;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    //final themeContext = ThemeContext.of(context);

    final isBold = style == TextButtonStyle.bold;
    final isLink = style == TextButtonStyle.link;
    final color = foregroundColor ??  AppColors.kBlack;
    
    final buttonStyle = ButtonStyle(
      fixedSize: size != null ? WidgetStatePropertyAll(size) : null,
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled) ? AppColors.kWhite : color,
      ),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      textStyle: WidgetStatePropertyAll(
        Theme.of(context).textButtonTheme.style?.textStyle
            ?.resolve({})
            ?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              decoration: isLink ? TextDecoration.underline : null,
              fontSize: fontSize ?? 14,
            ),
      ),
      shape:
          isLink
              ? const WidgetStatePropertyAll(LinearBorder.none)
              : WidgetStateProperty.resolveWith<OutlinedBorder?>(
                (Set<WidgetState> states) =>
                    states.contains(WidgetState.pressed)
                        ? LinearBorder.bottom(side: BorderSide(width: isBold ? 2.0 : 1.0, color: color))
                        : null,
              ),
      visualDensity: VisualDensity.compact,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    );
    final child = Text(
      label,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        decoration: isLink ? TextDecoration.underline : null,
        fontSize: fontSize ?? 14,
      ),
    );

    return Semantics(
      identifier: semanticsId,
      child:
          icon == null
              ? TextButton(onPressed: onPressed, style: buttonStyle, child: child)
              : TextButton.icon(
                onPressed: onPressed,
                style: buttonStyle,
                icon: icon,
                label: child,
                iconAlignment: iconAlignment,
              ),
    );
  }
}

enum TextButtonStyle { normal, bold, link }
