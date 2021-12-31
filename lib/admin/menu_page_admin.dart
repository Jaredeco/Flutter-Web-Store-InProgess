import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:webstore/constants/controllers.dart';

class AdminMenuPage extends StatelessWidget {
  final ZoomDrawerController drawerController;
  const AdminMenuPage({Key? key, required this.drawerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
          backgroundColor: const Color(0xff78909c),
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
                    ListTile(
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
                  ]),
            ),
          )),
    );
  }

  Widget menuItem(
      BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      selected: ModalRoute.of(context)!.settings.name == route,
      minLeadingWidth: 20,
      leading: Icon(icon),
      title: Text(title),
      onTap: () async {
        // final _receivePort = ReceivePort();
        // await Isolate.spawn(drawerController.toggle!(), _receivePort.sendPort);
        // await Future.doWhile(() => drawerController.isOpen!());
        // drawerController.toggle!();
        await Future(drawerController.toggle! as dynamic).then((value) {
          Navigator.of(context).pushNamed(route);
        });
      },
    );
  }
}
