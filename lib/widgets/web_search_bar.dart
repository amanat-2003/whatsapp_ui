import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.08,
      width: screenSize.width * 0.32,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: dividerColor),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              style: BorderStyle.none,
              width: 0,
            )
          ),
          hintText: 'Search or start new chat',
          hintStyle: const TextStyle(fontSize: 15),
          fillColor: searchBarColor,
          filled: true,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
