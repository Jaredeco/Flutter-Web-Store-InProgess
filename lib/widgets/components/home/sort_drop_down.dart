import 'package:flutter/material.dart';

class SortDropDown extends StatefulWidget {
  final List<String>? ddItems;
  final String? cValue;
  final double? width;
  final Function(String?)? onChanged;
  const SortDropDown(
      {Key? key, this.ddItems, this.cValue, this.width, this.onChanged})
      : super(key: key);
  @override
  _SortDropDownState createState() => _SortDropDownState();
}

class _SortDropDownState extends State<SortDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6078ea).withOpacity(0.3),
                offset: const Offset(0, 8),
                blurRadius: 8,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: widget.cValue,
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Color(0xFF7C8FB5)),
              items: widget.ddItems!
                  .map((String _item) => DropdownMenuItem(
                      value: _item,
                      child: Text(
                        _item,
                        style: const TextStyle(color: Color(0xFF7C8FB5)),
                      )))
                  .toList(),
              onChanged: widget.onChanged,
            ),
          ),
        ));
  }
}
