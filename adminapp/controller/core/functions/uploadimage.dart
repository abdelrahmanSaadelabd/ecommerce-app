import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

uploadimaheoncamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

uploadimaheonGallery([issvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:
        issvg
            ? ["svg", "SVG"]
            : ["svg", "SVG", "png", "PNG", "jpg", "JPG", "gif", "GIF"],
  );

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

Future<List<File>> uploadMultipleImagesFromGallery() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ["png", "PNG", "jpg", "JPG", "jpeg", "gif", "webp"],
  );

  if (result != null) {
    return result.paths.map((path) => File(path!)).toList();
  } else {
    return [];
  }
}
