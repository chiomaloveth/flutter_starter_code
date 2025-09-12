// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova/core/domain/utils/extensions.dart';
import 'package:nova/core/presentation/shared/styles/text_style.dart';
import 'package:nova/core/presentation/shared/widgets/spacing.dart';


class AppField extends StatelessWidget {
  const AppField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.obscure = false,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.onTap,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.readOnly = false,
    this.autovalidateMode,
    this.keyboardType = TextInputType.text,
    this.phoneCount = 0,
    this.minLines = 1,
    this.maxLines = 10,
    this.textInputAction,
    this.showTitle = true,
    this.onWordCountChanged,
    this.background,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool obscure;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function(int)? onWordCountChanged;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int phoneCount;
  final int minLines;
  final int maxLines;
  final TextInputAction? textInputAction;
  final bool showTitle;
  final Color? background;

  int _getWordCount(String text) {
    return text
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          TextRegular(title, fontWeight: FontWeight.w500),
          const SizedBox(height: 4,),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          minLines: minLines,
          maxLines: maxLines,
          onTap: onTap,
          onChanged: (value) {
            if (onChanged != null) onChanged!(value);
            if (onWordCountChanged != null) {
              final wordCount = _getWordCount(value);
              onWordCountChanged!(wordCount);
            }
          },
          validator: (value) {
            final wordCount = _getWordCount(value ?? '');
            if (wordCount > 50) {
              return 'Maximum 50 words required ($wordCount/50)';
            }
            return validator?.call(value);
          },
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSecondary,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor:
                background ?? context.colorScheme.onPrimary.withOpacity(0.1),
            prefix: prefix,
            suffixIcon: suffix,
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppSpacings.k4,
              horizontal: AppSpacings.k8,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 1.5,
                color: context.colorScheme.error.withOpacity(0.1),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,

            hintStyle: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSecondary.withOpacity(0.5),
            ),
          ),
        ).onTap(onTap: onTap),
      ],
    );
  }
}
