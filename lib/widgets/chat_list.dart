import 'package:flutter/material.dart';
import '../info.dart';
import '../widgets/my_message_card.dart';
import '../widgets/sender_message_card.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages.elementAt(index)['isMe'] == true) {
          return MyMessageCard(message: messages[index]['text'].toString(), time: messages[index]['time'].toString(),);
        } else {
          // Sender Message -> Card
          return SenderMessageCard(message: messages[index]['text'].toString(), time: messages[index]['time'].toString(),);
        }
      },
    );
  }
}
