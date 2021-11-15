import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminController extends GetxController {
  static AdminController instance = Get.find();
  var pickedImages = <XFile>[].obs;

  void addImages(List<XFile> imgs) {
    pickedImages += imgs;
    update();
  }

  Future uploadImages(List<XFile> images) async {
    List<String> imagesUrls = [];
    await Future.forEach(images, (XFile _image) async {
      Reference storageReference = FirebaseStorage.instance
          .refFromURL("gs://webstore-70cda.appspot.com")
          .child('products/${_image.name}');
      UploadTask uploadTask =
          storageReference.putData(await _image.readAsBytes());
      await uploadTask.whenComplete(() async {
        await storageReference
            .getDownloadURL()
            .then((value) => imagesUrls.add(value));
      });
    });
    return imagesUrls;
  }
}
