import 'package:flutter/material.dart';
import 'package:webstore/models/order_model.dart';

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
        onTap: () {},
        child: ListTile(
          leading: Text(widget.order.city!),
          title: Text("${widget.order.firstName} ${widget.order.surname}"),
        ),
      ),
    );
  }
}
