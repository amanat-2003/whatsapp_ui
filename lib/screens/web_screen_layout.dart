import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import '../screens/web_chat_appbar.dart';
import '../widgets/chat_list.dart';
import '../widgets/web_search_bar.dart';
import '../widgets/contacts_list.dart';
import '../widgets/web_profile_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: const [
                WebProfileBar(),
                WebSearchBar(),
                Expanded(child: ContactsList()),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.68,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgroundImage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const WebChatAppBar(),
                const Expanded(child: ChatList()),
                Container(
                  height: screenSize.height * 0.085,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: dividerColor),
                    ),
                    color: chatBarMessage,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attach_file,
                          size: 27,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    style: BorderStyle.none,
                                    width: 0,
                                  )),
                              hintText: 'Type a message',
                              hintStyle: const TextStyle(fontSize: 15),
                              fillColor: searchBarColor,
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                right: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          size: 27,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
