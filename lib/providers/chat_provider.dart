import 'package:ai_chatbot/models/message.dart';
import 'package:ai_chatbot/services/gemini_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geminiServiceProvider = Provider<GeminiService>((ref) {
  return GeminiService();
});

final chatProvider = StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) {
  return ChatNotifier(
    ref.read(geminiServiceProvider),
  );
});

final loadingProvider = StateProvider<bool>((ref) {
  return false;
});

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  final GeminiService geminiService;

  ChatNotifier(this.geminiService) : super([]);

  Future<void> sendMessage(String message, WidgetRef ref) async {
    if (message.trim().isEmpty) return;

    state = [
      ...state,
      ChatMessage(
        text: message,
        isUser: true,
      ),
    ];

    ref.read(loadingProvider.notifier).state = true;

    try {
      final response = await geminiService.sendMessage(message);

      state = [
        ...state,
        ChatMessage(
          text: response,
          isUser: false,
        ),
      ];
    } catch (e) {
      state = [
        ...state,
        ChatMessage(
          text: e.toString(),
          isUser: false,
        ),
      ];
    }

    ref.read(loadingProvider.notifier).state = false;
  }
}