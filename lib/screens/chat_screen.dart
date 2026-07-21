import 'package:ai_chatbot/providers/chat_provider.dart';
import 'package:ai_chatbot/widgets/chat_widget.dart';
import 'package:ai_chatbot/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final txtMsg = TextEditingController();
  final txtScroll = ScrollController();

  void sendMessage() {
    final message = txtMsg.text.trim();

    if (message.isEmpty) return;

    ref.read(chatProvider.notifier).sendMessage(message, ref);

    txtMsg.clear();

    Future.delayed(
      const Duration(milliseconds: 300),
          () {
        if (txtScroll.hasClients) {
          txtScroll.animateTo(
            txtScroll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    txtMsg.dispose();
    txtScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);
    final isLoading = ref.watch(loadingProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.smart_toy_rounded),
            SizedBox(width: 8),
            Text(
              "AI Chatbot",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Start a Conversation",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Ask anything to Gemini AI",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
                : ListView.builder(
              controller: txtScroll,
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatWidget(
                  message: messages[index],
                );
              },
            ),
          ),
          if (isLoading)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: const Row(
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "AI is typing...",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          MessageWidget(
            controller: txtMsg,
            onSend: sendMessage,
          ),
        ],
      ),
    );
  }
}