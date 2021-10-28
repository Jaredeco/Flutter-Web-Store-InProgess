import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webstore/models/bag_item_model.dart';
import 'package:webstore/models/cutomer_model.dart';

class OrderModel {
  final String? id;
  final List<BagItemModel>? products;
  final Timestamp? createdAt;
  final CustomerModel? customer;

  OrderModel({this.id, this.products, this.createdAt, this.customer});

  factory OrderModel.fromDocSnapshot(DocumentSnapshot snapshot) {
    return OrderModel(
        id: snapshot.id,
        products: snapshot["products"],
        createdAt: snapshot["createdAt"],
        customer: snapshot["customer"]);
  }
}
