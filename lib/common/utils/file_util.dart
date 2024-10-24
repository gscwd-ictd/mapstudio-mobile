import 'dart:typed_data';

import 'package:widgets_to_image/widgets_to_image.dart';

class FileUtil {
  static WidgetsToImageController flutterMapImageController =
      WidgetsToImageController();
  static Future<Uint8List?> captureFlutterMapImage() async {
    final image = await flutterMapImageController.capture();
    await Future.delayed(const Duration(seconds: 1));
    return image;
  }
}
