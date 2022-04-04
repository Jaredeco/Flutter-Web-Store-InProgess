import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/models/product_model.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  static List<String> selectCountries = ["Slovensko"];
  var isLoading = false.obs;
  var orderedProducts = [].obs;
  var country = selectCountries[0].obs;

  void createOrder(OrderModel _order) async {
    await firebaseFirestore.collection("Orders").add(_order.toJson());
    await sendEmail(
        name: "JR",
        email: "jano.redecha@gmail.com",
        subject: "Objednavka",
        message: "prva mail");
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_g3663yo';
    const templateId = 'template_6fn2ocq';
    const userId = 'user_4GFqs8Mw3pSzfAsasInwR';
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          }
        }));
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

  void setCountry(String val) {
    country.value = val;
    update();
  }
}
