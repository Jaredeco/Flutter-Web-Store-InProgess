import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webstore/models/product_model.dart';

class BagItemModel {
  final ProductModel? product;
  final String? productOption;

  BagItemModel({this.product, this.productOption});
}
