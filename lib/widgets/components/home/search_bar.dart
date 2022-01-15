import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? txtController;
  final Function(String)? onChanged;
  const SearchBar({Key? key, this.txtController, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFF23BCBA),
            Color(0xFF45E994),
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
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
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          controller: txtController,
          onChanged: onChanged,
          decoration: const InputDecoration(
              icon: Icon(Icons.search, color: Colors.white),
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: "Hľadať...",
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
