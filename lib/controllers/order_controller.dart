import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/models/product_model.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  var isLoading = false.obs;
  var orderedProducts = [].obs;

  void createOrder(OrderModel _order) {
    firebaseFirestore.collection("Orders").add(_order.toJson());
  }

  void loading(bool isl) {
    isLoading.value = isl;
    update();
  }

  Future<DocumentSnapshot> getOrder(String id) {
    if (id.isEmpty) {
      id = "empty";
    }
    return firebaseFirestore.collection("Orders").doc(id).get();
  }

  Stream<List<ProductModel>> loadOrderedProducts(List<String> ids) {
    Stream<QuerySnapshot> productsStream = firebaseFirestore
        .collection("Products")
        .where(FieldPath.documentId, whereIn: ids)
        .snapshots();
    return productsStream.map((qSnap) => qSnap.docs
        .map((docSnap) => ProductModel.fromDocSnapshot(docSnap))
        .toList());
  }

  // double getTotalOrdered(Map<String, int> bagProducts) {
  //   CollectionReference prcol = firebaseFirestore.collection("Products");
  //   double totalPrice = 0;
  //   bagProducts.forEach((key, value) async {
  //     double pp = (await prcol.doc(key).get())["price"];
  //     totalPrice += pp * value;
  //   });
  //   return totalPrice;
  // }
}
