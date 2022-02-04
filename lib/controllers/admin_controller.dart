import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminController extends GetxController {
  static AdminController instance = Get.find();
  var pickedImages = <XFile>[].obs;

  var orders = <OrderModel>[].obs;
  var isCreating = false.obs;
  var loggedIn = false.obs;
  var adminLogin;
  var adminPassword;

  @override
  void onInit() async {
    super.onInit();
    orders.bindStream(loadOrders());
  }

  void loading(bool isl) {
    isCreating.value = isl;
    update();
  }

  void changelogIn(bool state) {
    loggedIn.value = state;
    update();
  }

  Stream<List<OrderModel>> loadOrders() {
    Stream<QuerySnapshot> ordersStream = firebaseFirestore
        .collection("Orders")
        .orderBy("createdAt", descending: true)
        .snapshots();
    return ordersStream.map((qSnap) => qSnap.docs
        .map((docSnap) => OrderModel.fromDocSnapshot(docSnap))
        .toList());
  }

  void addImages(List<XFile> imgs) {
    pickedImages += imgs;
    update();
  }

  Future uploadImages(List<XFile> images) async {
    List<String> imagesUrls = [];
    await Future.forEach(images, (XFile _image) async {
      Reference storageReference = firebaseStorage
          .refFromURL("gs://vego-9f996.appspot.com")
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

  void getLoginCredentials() async {
    adminLogin = await firebaseFirestore
        .collection("AdminCredentials")
        .doc("Login")
        .get()
        .then((value) => value["Login"]);
    adminPassword = await firebaseFirestore
        .collection("AdminCredentials")
        .doc("Password")
        .get()
        .then((value) => value["Password"]);
  }
}
