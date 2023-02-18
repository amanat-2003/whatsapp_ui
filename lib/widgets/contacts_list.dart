import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/info.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const MobileChatScreen();
                },
              ));
            },
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              minVerticalPadding: 15,
              leading: CircleAvatar(
                radius: 35,
                backgroundImage:
                    NetworkImage(info[index]['profilePic'].toString()),
              ),
              title: Text(
                info[index]['name'] as String,
                style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                info[index]['message'] as String,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                info[index]['time'].toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              dense: false,
            ),
          ),
          const Divider(
            height: 0,
            color: dividerColor,
            // indent: 50,
          ),
        ],
      ),
      itemCount: info.length,
    );
  }
}
