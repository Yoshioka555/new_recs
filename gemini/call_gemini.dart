import 'package:google_generative_ai/google_generative_ai.dart';
import 'gemini_apikey.dart';

Future<String> callGemini(String text) async {
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: geminiApiKey,
  );
  final content = [
    Content.text(text),
  ];
  final response = await model.generateContent(content);
  return response.text!;
}
