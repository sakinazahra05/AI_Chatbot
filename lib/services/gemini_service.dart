import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  late final GenerativeModel model;

  GeminiService() {
    model = GenerativeModel(
      model: 'gemini-3.1-flash-lite',
      apiKey: dotenv.env['GEMINI_API_KEY']!,
    );
  }

  Future<String> sendMessage(String message) async {
    try {
      final response = await model.generateContent(
        [
          Content.text(message),
        ],
      );

      return response.text ?? "No response";
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}