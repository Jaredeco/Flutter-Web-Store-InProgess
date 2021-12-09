import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/product_model.dart';

class BagController extends GetxController {
  static BagController instance = Get.find();
  var products = {}.obs;
  Rx<double> totalAmount = 0.0.obs;

  void addToBag(ProductModel product, int amount) {
    products.update(
      product,
      (value) => ++value,
      ifAbsent: () => amount,
    );
    getTotal();
    update();
    storeBagState();
  }

  void removeFromBag(ProductModel product) {
    if (products[product]! > 1) {
      products.update(product, (value) => --value);
      getTotal();
      update();
      storeBagState();
    }
  }

  void deleteFromBag(ProductModel product) {
    products.remove(product);
    getTotal();
    update();
    storeBagState();
  }

  void emptyBag() {
    products.clear();
    totalAmount.value = 0.0;
    update();
    storeBagState();
  }

  void getTotal() {
    double _ta = 0.0;
    products.forEach((key, value) {
      _ta += key.price * value;
    });
    totalAmount.value = _ta;
  }

  void storeBagState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _ids = [];
    List<String> _amnts = [];
    products.forEach((key, value) {
      _ids.add(key.id.toString());
      _amnts.add(value.toString());
    });
    await prefs.setStringList("ids", _ids);
    await prefs.setStringList("amnts", _amnts);
  }

  void getStoredProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> _ids = prefs.getStringList("ids") ?? [];
    List<String> _amnts = prefs.getStringList("amnts") ?? [];
    List<ProductModel> _bagProducts = [];
    CollectionReference prodCol = firebaseFirestore.collection("Products");
    for (var item in _ids) {
      _bagProducts
          .add(ProductModel.fromDocSnapshot(await prodCol.doc(item).get()));
    }

    Map<ProductModel, int> _loadedProducts = {};
    await Future.forEach(
        _bagProducts,
        (ProductModel element) => _loadedProducts[element] =
            int.parse(_amnts[_ids.indexOf(element.id!)]));
    products.value = _loadedProducts;
    getTotal();
  }

  Map<String, int> getProducts() {
    Map<String, int> _orderProducts = {};
    for (var k in products.keys) {
      _orderProducts[k.id!] = products[k]!;
    }
    return _orderProducts;
  }
}
