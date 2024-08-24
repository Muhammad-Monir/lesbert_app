// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerProvider extends ChangeNotifier {
//   File? _imageFile1;
//   File? _imageFile2;
//   File? _imageFile3;
//   File? _imageFile4;

//   int _count = 0;

//   int get count => _count;

//   File? get imageFile1 => _imageFile1;
//   File? get imageFile2 => _imageFile2;
//   File? get imageFile3 => _imageFile3;
//   File? get imageFile4 => _imageFile4;

//   File? getImageFile(int index) {
//     switch (index) {
//       case 1:
//         return _imageFile1;
//       case 2:
//         return _imageFile2;
//       case 3:
//         return _imageFile3;
//       case 4:
//         return _imageFile4;
//       default:
//         return null;
//     }
//   }

//   void setImageFile(int index, File? image) {
//     switch (index) {
//       case 1:
//         _imageFile1 = image;
//         break;
//       case 2:
//         _imageFile2 = image;
//         break;
//       case 3:
//         _imageFile3 = image;
//         break;
//       case 4:
//         _imageFile4 = image;
//         break;
//     }
//     notifyListeners();
//   }

//   void resetImages(int index) {
//     switch (index) {
//       case 1:
//         _imageFile1 = null;
//         _count--;
//         break;
//       case 2:
//         _imageFile2 = null;
//         _count--;
//         break;
//       case 3:
//         _imageFile3 = null;
//         _count--;
//         break;
//       case 4:
//         _imageFile4 = null;
//         _count--;
//         break;
//     }
//     notifyListeners();
//   }

//   int get imageCount {
//     _count++;
//     // if (_imageFile1 != null) _count++;
//     // if (_imageFile2 != null) _count++;
//     // if (_imageFile3 != null) _count++;
//     // if (_imageFile4 != null) _count++;
//     return count;
//   }

//   void clearImages() {
//     _imageFile1 = null;
//     _imageFile2 = null;
//     _imageFile3 = null;
//     _imageFile4 = null;
//     notifyListeners();
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  File? _imageFile1;
  File? _imageFile2;
  File? _imageFile3;
  File? _imageFile4;

  File? get imageFile1 => _imageFile1;
  File? get imageFile2 => _imageFile2;
  File? get imageFile3 => _imageFile3;
  File? get imageFile4 => _imageFile4;

  File? getImageFile(int index) {
    switch (index) {
      case 1:
        return _imageFile1;
      case 2:
        return _imageFile2;
      case 3:
        return _imageFile3;
      case 4:
        return _imageFile4;
      default:
        return null;
    }
  }

  void setImageFile(int index, File? image) {
    switch (index) {
      case 1: 
        break;
      case 3:
        _imageFile3 = image;
        break;
      case 4:
        _imageFile4 = image;
        break;
    }
    notifyListeners();
  }

  void resetImages(int index) {
    switch (index) {
      case 1:
        _imageFile1 = null;
        break;
      case 2:
        _imageFile2 = null;
        break;
      case 3:
        _imageFile3 = null;
        break;
      case 4:
        _imageFile4 = null;
        break;
    }
    notifyListeners();
  }

  /// This method returns the list of images
  List<File>? getImages() {
    List<File> images = [];
    if (_imageFile1 != null) images.add(_imageFile1!);
    if (_imageFile2 != null) images.add(_imageFile2!);
    if (_imageFile3 != null) images.add(_imageFile3!);
    if (_imageFile4 != null) images.add(_imageFile4!);
    return images.isNotEmpty ? images : null;
  }

  void clearImages() {
    _imageFile1 = null;
    _imageFile2 = null;
    _imageFile3 = null;
    _imageFile4 = null;
    notifyListeners();
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerProvider extends ChangeNotifier {
//   File? _imageFile1;
//   File? _imageFile2;
//   File? _imageFile3;
//   File? _imageFile4;
//   List<String> _fetchedImages = [];

//   File? get imageFile1 => _imageFile1;
//   File? get imageFile2 => _imageFile2;
//   File? get imageFile3 => _imageFile3;
//   File? get imageFile4 => _imageFile4;
//   List<String> get fetchedImages => _fetchedImages;

//   void setFetchedImages(List<String> images) {
//     _fetchedImages = images;
//     notifyListeners();
//   }

//   // Rest of your existing methods...
// }

class EditImagePickerProvider with ChangeNotifier {
  XFile? _image;

  XFile? get image => _image;

  Future<void> pickImageFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<void> pickImageFromCamera() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      _image = pickedImage;
      notifyListeners();
    }
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }
}

class UploadImageProvider with ChangeNotifier {
  XFile? _selectedImage;

  XFile? get selectedImage => _selectedImage;

  Future<void> pickImageFromGallery() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<void> pickImageFromCamera() async {
    await _pickImage(ImageSource.camera);
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      _selectedImage = pickedImage;
      notifyListeners();
    }
  }

  void clearImage() {
    _selectedImage = null;
    notifyListeners();
  }
}
