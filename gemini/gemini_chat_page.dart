import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  ChatRoomState createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> {
  final List<types.Message> _messages = [];

  final _gemini = const types.User(
    id: 'gemini',
    firstName: "Gemini",
  );

  final _user = const types.User(
    id: 'user',
    firstName: "User",
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Gemini Chat Page'),
        ),
        body: Chat(
          user: _user,
          messages: _messages,
          onSendPressed: _handleSendPressed,
          //showUserAvatars: true,
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      //createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'randomstring',
      text: message.text,
    );
    _addMessage(textMessage);
  }
}
