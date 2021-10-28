import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  final products = <ProductModel>[].obs;
  @override
  void onInit() async {
    products.bindStream(loadProducts());
    super.onInit();
  }

  Stream<List<ProductModel>> loadProducts() {
    Stream<QuerySnapshot> productsStream =
        firebaseFirestore.collection("Products").snapshots();
    return productsStream.map((qSnap) => qSnap.docs
        .map((docSnap) => ProductModel.fromDocSnapshot(docSnap))
        .toList());
  }
}
