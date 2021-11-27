import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webstore/admin/orders/orders.dart';
import 'package:webstore/admin/products/create_product.dart';
import 'package:webstore/admin/products/products.dart';
import 'package:webstore/screens/main/home_page.dart';

class AdminNavBar extends StatelessWidget {
  const AdminNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed('/admin/orders'),
              child: SizedBox(
                  height: 90,
                  width: 150,
                  child: Image.asset("assets/images/admin.png")),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/admin/create-product'),
                  icon: const Icon(Icons.add)),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/admin/products'),
                icon: const Icon(Icons.shopping_bag),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed('/'),
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 35),
            ],
          ),
        ],
      ),
    );
  }
}
