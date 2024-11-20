import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:filepicker_windows/filepicker_windows.dart';

class ImageHandler {
  static Future<String?> pickImage() async {
    if (Platform.isWindows) {
      final file = OpenFilePicker()
        ..filterSpecification = {
          'Image (*.png)': '*.png',
        }
        ..defaultFilterIndex = 0
        ..title = 'Select an Image';

      final result = file.getFile();
      return result?.path;
    }
    var tmp = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    return tmp?.path;
  }
  static Future<List<String>?> pickMultiImage() async {
    if (Platform.isWindows) {
      final file = OpenFilePicker()
        ..filterSpecification = {
          'Image (*.png)': '*.png',
        }
        ..defaultFilterIndex = 0
        ..title = 'Select an Image';

      final result = file.getFile();
      return [];
    }
    var tmp = await ImagePicker().pickMultiImage(
      imageQuality: 100,
    );
    return tmp.isEmpty ? [] : tmp.map((e) => e.path).toList();
  }
}
