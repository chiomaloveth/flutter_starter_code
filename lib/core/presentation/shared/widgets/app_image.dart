// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova/core/domain/utils/extensions.dart';


class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.shape,
    this.borderRadius,
    this.child,
    this.fit,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final Widget? child;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      imageBuilder:
          (context, imageProvider) => Container(
            width: width ?? 100,
            height: height ?? 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: borderRadius,
              shape: shape ?? BoxShape.rectangle,
            ),
            child: child,
          ),
      errorWidget:
          (context, url, error) => Container(
            width: width ?? 100,
            height: height ?? 100,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              shape: shape ?? BoxShape.rectangle,
              color: context.colorScheme.onSecondary.withOpacity(0.2),
            ),
            child: Icon(Icons.error, color: context.colorScheme.error),
          ),
      placeholder:
          (context, url) => GlassContainer(
            child: Container(
              width: width ?? 100,
              height: height ?? 100,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                shape: shape ?? BoxShape.rectangle,
                // color: context.colorScheme.onSecondary.withOpacity(0.5),
              ),
            ),
          ),
    );
  }
}

class AppFileImage extends StatelessWidget {
  const AppFileImage({
    super.key,
    required this.imageFile,
    this.height,
    this.width,
    this.shape,
    this.borderRadius,
    this.child,
    this.fit,
  });
  final XFile imageFile;
  final double? height;
  final double? width;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final Widget? child;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final file = File(imageFile.path);
    return Container(
      width: width ?? 100,
      height: height ?? 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: FileImage(file), fit: BoxFit.cover),
        borderRadius: borderRadius,
        shape: shape ?? BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
