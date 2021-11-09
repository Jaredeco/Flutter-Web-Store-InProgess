import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webstore/models/order_model.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  TextEditingController nameTextController = TextEditingController();
  
}
