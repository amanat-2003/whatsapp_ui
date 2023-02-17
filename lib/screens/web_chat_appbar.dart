import 'package:flutter/material.dart';
import 'package:whatsapp_ui/info.dart';

import '../colors.dart';

class WebChatAppBar extends StatelessWidget {
  const WebChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.08,
      width: screenSize.width * 0.68,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: webAppBarColor,
        border: Border(right: BorderSide(color: dividerColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=800'),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                info[1]['name'].toString(),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.grey,)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
