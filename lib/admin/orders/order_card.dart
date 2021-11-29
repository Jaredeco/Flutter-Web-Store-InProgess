import 'package:flutter/material.dart';
import 'package:webstore/models/order_model.dart';
import 'package:webstore/widgets/customWidgets/custom_text.dart';

class OrderCard extends StatefulWidget {
  final OrderModel order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () {
          Navigator.of(context).pushNamed("/admin/orders/${widget.order.id}");
        },
        child: ListTile(
          shape: const StadiumBorder(),
          tileColor: widget.order.resolved! ? Colors.green : Colors.red,
          leading: CustomText(
            text: widget.order.city!,
            color: Colors.white,
          ),
          title: CustomText(
              text: "${widget.order.firstName} ${widget.order.surname}",
              color: Colors.white),
          trailing: CustomText(
              text: widget.order.total.toString(), color: Colors.white),
        ),
      ),
    );
  }
}
