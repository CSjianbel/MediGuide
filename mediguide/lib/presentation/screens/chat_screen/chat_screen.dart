import 'package:flutter/material.dart';

import 'package:mediguide/presentation/screens/chat_screen/widgets/app_bar.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/user_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/bot_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/navigation_drawer.dart'
    as navigation_drawer;
import 'package:mediguide/utils/theme_utils.dart';
import 'package:mediguide/utils/theme_constants.dart';

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
  final TextEditingController messageController = TextEditingController();
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
    final ThemeData currentTheme = ThemeUtils.getTheme(context);
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
              Container(
                padding: const EdgeInsets.all(15.0),
                color: currentTheme.appBarTheme.backgroundColor,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextFormField(
                          controller: messageController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    ThemeUtils.getIconBackground(currentTheme),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'How are you feeling today?',
                            hintStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: accentColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: IconButton(
                        icon: const Icon(Icons.send,
                            color: lightForeground, size: 20),
                        onPressed: () {
                          setState(() {
                            messages.add(Message(
                                bot: false, message: messageController.text));
                            FocusScope.of(context).unfocus();
                            messageController.text = '';
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: const SafeArea(
          child: navigation_drawer.NavigationDrawer(),
        ));
  }
}
