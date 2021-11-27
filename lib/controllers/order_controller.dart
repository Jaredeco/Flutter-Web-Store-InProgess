import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/order_model.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  var isLoading = false.obs;

  void createOrder(OrderModel _order) {
    firebaseFirestore.collection("Orders").add(_order.toJson());
  }

  void loading(bool isl) {
    isLoading.value = isl;
    update();
  }
}
