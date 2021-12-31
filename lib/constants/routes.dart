import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:webstore/admin/login_admin.dart';
import 'package:webstore/admin/orders/order_page.dart';
import 'package:webstore/admin/orders/orders.dart';
import 'package:webstore/admin/products/create_product.dart';
import 'package:webstore/admin/products/product_page_admin.dart';
import 'package:webstore/admin/products/products.dart';
import 'package:webstore/screens/helper/notfound_page.dart';
import 'package:webstore/screens/landing/home_page.dart';
import 'package:webstore/screens/main/shop_page.dart';
import 'package:webstore/screens/main/order_page.dart';
import 'package:webstore/screens/main/product_page.dart';
import 'package:webstore/screens/main/shopping_bag.dart';
import 'package:webstore/screens/helper/thank_you.dart';

class FlouroRouter {
  static final FluroRouter router = FluroRouter();
  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const HomePage());

  static final Handler _shopHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const ShopPage());

  static final Handler _productHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ProductPage(
            productId: params['id'][0],
          ));
  static final Handler _bagHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const ShoppingBag());

  static final Handler _orderHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          OrderPage());
  static final Handler _adminHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const Admin());

  static final Handler _adminOrdersHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const AdminOrders());

  static final Handler _adminProductsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const AdminProducts());

  static final Handler _adminCreateProductHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const AdminCreateProduct());

  static final Handler _adminProductPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          AdminProductPage(productId: params["id"][0]));

  static final Handler _adminOrderHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          AdminOrderPage(orderId: params["id"][0]));

  static final Handler _thankyouHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const ThankYouPage());

  static void setupRouter() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const NotFoundPage();
    });
    // Main
    router.define('/', handler: _homeHandler);
    router.define('/shop', handler: _shopHandler);
    router.define('/product/:id', handler: _productHandler);
    router.define('/shopping-bag', handler: _bagHandler);
    router.define("/order", handler: _orderHandler);
    router.define("/thankyou", handler: _thankyouHandler);

    // Admin
    router.define('/admin', handler: _adminHandler);
    router.define('/admin/orders', handler: _adminOrdersHandler);
    router.define("/admin/products", handler: _adminProductsHandler);
    router.define("/admin/create-product", handler: _adminCreateProductHandler);
    router.define("/admin/orders/:id", handler: _adminOrderHandler);
    router.define("/admin/products/:id", handler: _adminProductPageHandler);
  }
}
