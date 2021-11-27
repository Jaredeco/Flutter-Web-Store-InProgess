import 'package:flutter/material.dart';
import 'package:webstore/constants/controllers.dart';

class CustomDropDown extends StatefulWidget {
  final List<String>? ddItems;
  final String? cValue;
  const CustomDropDown({Key? key, this.ddItems, this.cValue}) : super(key: key);
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: widget.cValue,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            items: widget.ddItems!
                .map((String _item) =>
                    DropdownMenuItem(value: _item, child: Text(_item)))
                .toList(),
            onChanged: (newValue) {
              adminController.setCountry(newValue.toString());
            },
          ),
        ),
      ),
    );
  }
}
