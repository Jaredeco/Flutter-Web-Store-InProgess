import 'package:get/get.dart';
import 'package:webstore/models/product_model.dart';

class BagController extends GetxController {
  static BagController instance = Get.find();
  final Map<ProductModel, int> products = <ProductModel, int>{}.obs;
  Rx<double> totalAmount = 0.0.obs;
  void addToBag(ProductModel product) {
    products.update(
      product,
      (value) => ++value,
      ifAbsent: () => 1,
    );
    totalAmount.value += product.price!;
    update();
  }

  void removeFromBag(ProductModel product) {
    if (products[product]! > 1) {
      products.update(product, (value) => --value);
      totalAmount.value -= product.price!;
      update();
    }
  }

  void deleteFromBag(ProductModel product) {
    totalAmount.value -= products[product]! * product.price!;
    products.remove(product);
    update();
  }
}
