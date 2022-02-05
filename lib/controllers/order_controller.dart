import 'package:universal_io/io.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mailto/mailto.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/models/product_model.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  static List<String> selectCountries = ["Slovensko"];
  var isLoading = false.obs;
  var orderedProducts = [].obs;
  var country = selectCountries[0].obs;

  void createOrder(OrderModel _order) async {
    await firebaseFirestore.collection("Orders").add(_order.toJson());
    final mailto = Mailto(
      to: [
        'jano.redecha@gmail.com',
      ],
      // cc: [
      //   'percentage%100@example.com',
      //   'QuestionMark?address@example.com',
      // ],
      // bcc: [
      //   'Mike&family@example.org',
      // ],
      subject: 'Let\'s drink a "café"! ☕️ 2+2=4 #coffeeAndMath',
      body:
          'Hello this if the first line!\n\nNew line with some special characters őúóüűáéèßáñ\nEmoji: 🤪💙👍',
    );

    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
    String renderHtml(Mailto mailto) =>
        '''<html><head><title>mailto example</title></head><body><a href="$mailto">Open mail client</a></body></html>''';
    await for (HttpRequest request in server) {
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.html
        ..write(renderHtml(mailto));
      await request.response.close();
    }
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
