import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String>? ddItems;
  final String? cValue;
  final double? width;
  final Function(String?)? onChanged;
  const CustomDropDown(
      {Key? key, this.ddItems, this.cValue, this.width, this.onChanged})
      : super(key: key);
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Material(
          color: Colors.white,
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: widget.cValue,
                icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                items: widget.ddItems!
                    .map((String _item) =>
                        DropdownMenuItem(value: _item, child: Text(_item)))
                    .toList(),
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ));
  }
}
