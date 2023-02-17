import 'package:flutter/material.dart';
import '../widgets/web_search_bar.dart';
import '../widgets/contacts_list.dart';
import '../widgets/web_profile_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: const [
                WebProfileBar(),
                WebSearchBar(),
                ContactsList(),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.68,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/backgroundImage.png'),
              fit: BoxFit.cover,
            )),
          ),
        ],
      ),
    );
  }
}
