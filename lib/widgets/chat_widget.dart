import 'package:ai_chatbot/models/message.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final ChatMessage message;

  const ChatWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: message.isUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!message.isUser)
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.smart_toy,
                    color: Colors.white,
                    size: 18,
                  ),
                ),

              if (!message.isUser)
                const SizedBox(width: 8),

              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomLeft: Radius.circular(
                        message.isUser ? 18 : 4,
                      ),
                      bottomRight: Radius.circular(
                        message.isUser ? 4 : 18,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isUser
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              if (message.isUser)
                const SizedBox(width: 8),

              if (message.isUser)
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}