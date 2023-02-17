import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class SenderMessageCard extends StatelessWidget {
  final String message;
  final String time;
  const SenderMessageCard({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenSize.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: senderMessageColor,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 10, right: 30, top: 5),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white60,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
