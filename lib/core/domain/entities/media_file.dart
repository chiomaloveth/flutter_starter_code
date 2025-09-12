import 'dart:typed_data';

class MediaFile {
  MediaFile({required this.bytes, required this.type, required this.size, required this.width, required this.height});
  final Uint8List bytes;
  final MediaType type;
  final int size;
  final int width;
  final int height;
}

enum MediaType { image }
