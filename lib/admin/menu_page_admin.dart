import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:webstore/constants/controllers.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class AdminMenuPage extends StatelessWidget {
  final ZoomDrawerController drawerController;
  const AdminMenuPage({Key? key, required this.drawerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    menuItem(context, Icons.local_shipping, "Orders",
                        "/admin/orders"),
                    menuItem(context, Icons.add, "Create Product",
                        "/admin/create-product"),
                    menuItem(context, Icons.shop, "Shop", "/admin/products"),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          child: ListTile(
                            selectedTileColor: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            minLeadingWidth: 20,
                            leading: const Icon(
                              Icons.exit_to_app,
                              color: Colors.red,
                            ),
                            title: const Text("Log Out"),
                            onTap: () async {
                              adminController.changelogIn(false);
                              await Future(drawerController.toggle! as dynamic)
                                  .then((value) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/shop', (route) => false);
                              });
                            },
                          ),
                        )),
                  ]),
            ),
          )),
    );
  }

  Widget menuItem(
      BuildContext context, IconData icon, String title, String route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          selected: ModalRoute.of(context)!.settings.name == route,
          minLeadingWidth: 20,
          selectedTileColor: Colors.grey[100],
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: CustomText(
            text: title,
            color: Colors.black,
          ),
          onTap: () async {
            await Future(drawerController.toggle! as dynamic).then((value) {
              Navigator.of(context).pushNamed(route);
            });
          },
        ),
      ),
    );
  }
}
