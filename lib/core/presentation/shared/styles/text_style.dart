import 'package:flutter/material.dart';
import 'package:nova/core/domain/utils/extensions.dart';
import 'package:nova/core/presentation/themes/colors.dart';
import 'package:nova/core/presentation/shared/styles/fonts.dart';



class AppTextBase extends StatelessWidget {
  const AppTextBase(
    this.text, {
    this.style,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.visible,
    this.maxLines = 1,
    this.softWrap,
    super.key,
    this.height,
    this.letterSpacing,
  }) : assert(text != null, 'test cannot be null');

  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final double? height;
  final double? letterSpacing;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 14,
        fontFamily: AppFont.font,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class TextRegularGrey extends AppTextBase {
  TextRegularGrey(
    String super.text, {
    super.key,
    TextStyle? style,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    super.textAlign,
    super.overflow,
    super.softWrap,
    super.maxLines = 3,
  }) : _color = color,
       super(
         style: TextStyle(
           fontSize: fontSize,
           fontWeight: fontWeight,
         ).merge(style),
       );

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    final defaultColor = context.colorScheme.onSecondary;
    return AppTextBase(
      super.text ?? '',
      textAlign: textAlign,
      style: TextStyle(
        color: _color ?? defaultColor,
        fontFamily: "Poppins-Medium",
      ).merge(super.style),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class TextRegular extends AppTextBase {
  TextRegular(
    String super.text, {
    super.key,
    TextStyle? style,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
    double? height,
    double? letterSpacing,
    super.textAlign,
    super.overflow,
    super.softWrap,
    super.maxLines = 3,
  }) : _color = color,
       super(
         style: TextStyle(
           fontSize: fontSize,
           fontWeight: fontWeight,
           height: height,
           letterSpacing: letterSpacing,
         ).merge(style),
       );

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return AppTextBase(
      super.text ?? '',
      textAlign: textAlign,
      style: TextStyle(
        color: _color ?? AppColors.kBlack,
        height: height,
        letterSpacing: letterSpacing,
      ).merge(super.style),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class TextHeader extends AppTextBase {
  const TextHeader(
    String super.text, {
    super.key,
    super.style,
    double fontSize = 22,
    super.textAlign = null,
    TextOverflow? overflow,
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
    super.maxLines = 2,
    super.softWrap,
  }) : _customStyle = style,
       _fontSize = fontSize,
       _color = color ?? AppColors.kBlack,
       _fontWeight = fontWeight,
       super(overflow: overflow ?? TextOverflow.ellipsis);

  final TextStyle? _customStyle;
  final double _fontSize;
  final Color? _color;
  final FontWeight? _fontWeight;

  @override
  Widget build(BuildContext context) {
    final defaultColor = context.colorScheme.onPrimary;
    final textStyle = TextStyle(
      fontSize: _fontSize,
      fontWeight: _fontWeight,
      color: _color ?? defaultColor,
    ).merge(_customStyle);
    return AppTextBase(
      text ?? '',
      style: textStyle,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class TextBold extends AppTextBase {
  const TextBold(
    String super.text, {
    super.key,
    super.style,
    double fontSize = 14,
    super.textAlign = null,
    TextOverflow? overflow,
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    super.maxLines = 2,
  }) : _customStyle = style,
       _fontSize = fontSize,
       _color = color,
       _fontWeight = fontWeight,
       super(overflow: overflow ?? TextOverflow.ellipsis);

  final TextStyle? _customStyle;
  final double _fontSize;
  final Color? _color;
  final FontWeight? _fontWeight;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: _fontSize,
      fontWeight: _fontWeight,
      color: _color ?? AppColors.kBlack,
    ).merge(_customStyle);
    return AppTextBase(
      text ?? '',
      style: textStyle,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class AppTextRich extends StatelessWidget {
  const AppTextRich({
    super.key,
    this.text,
    required this.spans,
    this.style,
    this.textAlign = TextAlign.left,
    this.maxLines = 3,
    this.overflow = TextOverflow.visible,
    this.softWrap,
  });

  final String? text;
  final List<InlineSpan> spans;
  final TextStyle? style;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text ?? '',
        style: const TextStyle(
          fontSize: 14,
          fontFamily: AppFont.font,
        ).merge(style),
        children: spans,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}

class TextRegularRich extends AppTextRich {
  TextRegularRich({
    super.text,
    required super.spans,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    TextStyle? style,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.softWrap,
    super.key,
  }) : super(
         style: TextStyle(
           fontSize: fontSize,
           fontWeight: fontWeight,
           color: color ?? AppColors.kBlack,
           fontFamily: "Poppins-Regular",
         ).merge(style),
       );
}
