import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:nova/core/domain/exceptions/error_code.dart';



@lazySingleton
class FilePickerService {
  // AppFilePicker._();
  // static AppFilePicker instance = AppFilePicker._();
  static final Logger _logger = Logger('AppFilePicker');

  final ImagePicker _picker = ImagePicker();

  Future<Either<ErrorCode, List<File>>> pickMultipleImages() async {
    try {
      final pickedFiles = await _picker.pickMultiImage(limit: 2);
      if (pickedFiles.isNotEmpty) {
        final images = pickedFiles.map((e) => File(e.path)).toList();
        return Right(images);
      }
      return const Left(ErrorCode.cancelPickMedia);
    } catch (e, t) {
      _logger.severe('pickMultipleImages failed', e, t);
      return const Left(ErrorCode.couldNotPickImage);
    }
  }

  Future<Either<ErrorCode, File>> pickSingleImage() async {
    try {
      final pickedFiles = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFiles != null) {
        return Right(File(pickedFiles.path));
      }
      return const Left(ErrorCode.cancelPickMedia);
    } catch (e, t) {
      _logger.severe('pickSingleImage failed', e, t);
      return const Left(ErrorCode.couldNotPickImage);
    }
  }

  Future<Either<ErrorCode, File>> takeImageFromCamera() async {
    try {
      final pickedFiles = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFiles != null) {
        return Right(File(pickedFiles.path));
      }
      return const Left(ErrorCode.cancelPickMedia);
    } catch (e, t) {
      _logger.severe('pickSingleImage failed', e, t);
      return const Left(ErrorCode.couldNotPickImage);
    }
  }

  Future<String> fileToBase64(File file) async {
    try {
      final bytes = await file.readAsBytes();
      final base64Str = base64Encode(bytes);
      return 'data:image/png;base64,$base64Str';
    } catch (e, t) {
      _logger.severe('fileToBase64 failed', e, t);
      return '';
    }
  }
}

extension CalculateSize on File {
  static final Logger _logger = Logger('CalculateSize');

  Future<(int, int)?> calculateImageDimensions(File imageFile) async {
    try {
      final image = img.decodeImage(await readAsBytes());
      if (image != null) {
        return (image.width, image.height);
      }
      return null;
    } catch (e, t) {
      _logger.severe('calculateImageDimensions failed for $path', e, t);
      return null;
    }
  }

  Future<int> getFileSize() async {
    final bytes = await length();
    return bytes;
  }

  
}
