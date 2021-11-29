import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  var products = <ProductModel>[].obs;
  var selectedImage = 0.obs;
  var amount = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    products.bindStream(loadProducts());
  }

  void changeImg(int idx) {
    selectedImage.value = idx;
    update();
  }

  void incAmount() {
    ++amount;
    update();
  }

  void decAmount() {
    if (amount > 1) {
      --amount;
      update();
    }
  }

  Stream<List<ProductModel>> loadProducts() {
    Stream<QuerySnapshot> productsStream =
        firebaseFirestore.collection("Products").orderBy("createdAt", descending: true).snapshots();
    return productsStream.map((qSnap) => qSnap.docs
        .map((docSnap) => ProductModel.fromDocSnapshot(docSnap))
        .toList());
  }

  Future<DocumentSnapshot> getProduct(String id) {
    if (id.isEmpty){
      id = "empty";
    }
    return firebaseFirestore.collection("Products").doc(id).get();
  }
}
