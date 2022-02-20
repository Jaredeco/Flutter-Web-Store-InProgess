import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webstore/constants/firebase.dart';
import 'package:webstore/models/bag_item_model.dart';
import 'package:webstore/models/product_model.dart';
import 'package:collection/collection.dart';

class BagController extends GetxController {
  static BagController instance = Get.find();
  var products = {}.obs;
  Rx<double> totalAmount = 0.0.obs;

  BagItemModel getBagItem(ProductModel product, String option) {
    BagItemModel bagItem =
        BagItemModel(product: product, productOption: option);
    return products.keys.firstWhere(
        (element) =>
            element.product == bagItem.product &&
            element.productOption == bagItem.productOption,
        orElse: () => bagItem);
  }

  void addToBag(ProductModel product, String option, int amount) {
    products.update(
      getBagItem(product, option),
      (value) => ++value,
      ifAbsent: () => amount,
    );
    getTotal();
    update();
    storeBagState();
  }

  void removeFromBag(ProductModel product, String option) {
    if (products[getBagItem(product, option)] > 1) {
      products.update(getBagItem(product, option), (value) => --value);
      getTotal();
      update();
      storeBagState();
    }
  }

  void deleteFromBag(ProductModel product, String option) {
    BagItemModel bagItem =
        BagItemModel(product: product, productOption: option);
    products.removeWhere((key, value) =>
        key.product == bagItem.product &&
        key.productOption == bagItem.productOption);
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
      _ta += key.product.price * value;
    });
    totalAmount.value = _ta;
  }

  void storeBagState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _ids = [];
    List<String> _options = [];
    List<String> _amnts = [];
    products.forEach((key, value) {
      _ids.add(key.product.id.toString());
      _options.add(key.productOption.toString());
      _amnts.add(value.toString());
    });
    await prefs.setStringList("ids", _ids);
    await prefs.setStringList("options", _options);
    await prefs.setStringList("amnts", _amnts);
  }

  void getStoredProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> _ids = prefs.getStringList("ids") ?? [];
    List<String> _options = prefs.getStringList("options") ?? [];
    List<String> _amnts = prefs.getStringList("amnts") ?? [];
    List<ProductModel> _bagProducts = [];
    CollectionReference prodCol = firebaseFirestore.collection("Products");
    for (var item in _ids) {
      _bagProducts
          .add(ProductModel.fromDocSnapshot(await prodCol.doc(item).get()));
    }

    var _loadedProducts = {};
    for (List pairs in IterableZip([_bagProducts, _options])) {
      _loadedProducts[
              BagItemModel(product: pairs[0], productOption: pairs[1])] =
          int.parse(_amnts[_ids.indexOf(pairs[0].id!)]);
    }
    products.value = _loadedProducts;
    getTotal();
  }

  Map<List<dynamic>, int> getProducts() {
    Map<List<dynamic>, int> _orderProducts = {};
    for (var k in products.keys) {
      _orderProducts[[k.product.id!, k.productOption]] =
          products[getBagItem(k.product, k.productOption)]!;
    }
    return _orderProducts;
  }
}
