import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/product_model.dart';
import 'package:webstore/widgets/components/home/product_card.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  static List<String> orderBys = [
    "Latest",
    "Price: Ascending",
    "Price: Descending"
  ];
  var products = <ProductModel>[].obs;
  var selectedImage = 0.obs;
  var amount = 1.obs;
  var query = "".obs;
  var orderBy = orderBys[0].obs;

  @override
  void onInit() {
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
    CollectionReference<Map<String, dynamic>> productsCollection =
        firebaseFirestore.collection("Products");
    Stream<QuerySnapshot> productsStream;
    if (orderBys.indexOf(orderBy.value) == 0) {
      productsStream =
          productsCollection.orderBy("createdAt", descending: true).snapshots();
    } else if (orderBys.indexOf(orderBy.value) == 1) {
      productsStream = productsCollection.orderBy("price").snapshots();
    } else {
      productsStream =
          productsCollection.orderBy("price", descending: true).snapshots();
    }

    return productsStream.map((qSnap) => qSnap.docs
        .map((docSnap) => ProductModel.fromDocSnapshot(docSnap))
        .toList());
  }

  void search(String q) {
    query.value = q;
    update();
  }

  List<Widget> searchProducts(AnimationController animationController) {
    List<ProductModel> _searchedProducts = [];
    for (ProductModel element in products) {
      if (element.title!.toLowerCase().contains(query.toLowerCase())) {
        _searchedProducts.add(element);
      }
    }
    if (_searchedProducts.isEmpty) {
      return [const Text("No results...")];
    }
    animationController.reset();
    return _searchedProducts
        .map((item) {
          animationController.forward();
          return ProductCard(
            product: item,
            animationController: animationController,
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: animationController,
                    curve: Interval(
                        (1 / _searchedProducts.length) *
                            _searchedProducts.indexOf(item),
                        1.0,
                        curve: Curves.fastOutSlowIn))),
          );
        })
        .toList()
        .cast<Widget>();
  }

  Future<DocumentSnapshot> getProduct(String id) {
    if (id.isEmpty) {
      id = "empty";
    }
    return firebaseFirestore.collection("Products").doc(id).get();
  }

  void setOrderBy(String newValue) {
    orderBy.value = newValue;
    update();
  }
}
