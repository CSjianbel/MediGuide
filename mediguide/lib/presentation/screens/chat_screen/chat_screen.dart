import 'package:flutter/material.dart';

import 'package:mediguide/presentation/screens/chat_screen/widgets/app_bar.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/user_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/bot_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/chat_input_section.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/navigation_drawer.dart'
    as navigation_drawer;

class Message {
  final String message;
  final bool bot;

  Message({required this.bot, required this.message});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(
        bot: true,
        message:
            "Hello! I am MediGuide. How can I assist you today? If you're not feeling your best, just let me know your symptoms, and I'll do my best to provide you with some insights. Remember, I'm here to help, but for accurate medical advice, always consult a healthcare professional."),
    Message(
        bot: false,
        message:
            "Hello! I am MediGuide. How can I assist you today? If you're not feeling your best, just let me know your symptoms, and I'll do my best to provide you with some insights. Remember, I'm here to help, but for accurate medical advice, always consult a healthcare professional."),
    Message(
        bot: true,
        message:
            "Hello! I am MediGuide. How can I assist you today? If you're not feeling your best, just let me know your symptoms, and I'll do my best to provide you with some insights. Remember, I'm here to help, but for accurate medical advice, always consult a healthcare professional."),
    Message(
        bot: false,
        message:
            "Hello! I am MediGuide. How can I assist you today? If you're not feeling your best, just let me know your symptoms, and I'll do my best to provide you with some insights. Remember, I'm here to help, but for accurate medical advice, always consult a healthcare professional."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SafeArea(child: CustomAppBar()),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(15.0),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (messages[index].bot) {
                          return BotChatBubble(
                              message: messages[index].message);
                        }
                        return UserChatBubble(message: messages[index].message);
                      })),
              const ChatInputSection(),
            ],
          ),
        ),
        drawer: const SafeArea(
          child: navigation_drawer.NavigationDrawer(),
        ));
  }
}
