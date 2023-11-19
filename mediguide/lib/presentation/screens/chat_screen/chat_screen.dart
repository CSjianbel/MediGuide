import 'package:flutter/material.dart';

import 'package:mediguide/presentation/screens/chat_screen/widgets/app_bar.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/user_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/bot_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/chat_input_section.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/navigation_drawer.dart' as navigation_drawer;

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15.0),
              children: const <Widget>[
                BotChatBubble(
                    message:
                        "Hello! I am MediGuide. How can I assist you today? If you're not feeling your best, just let me know your symptoms, and I'll do my best to provide you with some insights. Remember, I'm here to help, but for accurate medical advice, always consult a healthcare professional."),
                UserChatBubble(
                    message: "shivering, chills, joint pain, headache"),
                BotChatBubble(
                    message:
                        "Based on your symptoms, you might have gastroenteritis. Gastroenteritis is a short-term illness triggered by the infection and inflammation of the digestive system."),
                UserChatBubble(
                    message: "shivering, chills, joint pain, headache"),
                BotChatBubble(
                    message:
                        "Based on your symptoms, you might have gastroenteritis. Gastroenteritis is a short-term illness triggered by the infection and inflammation of the digestive system.")
              ],
            ),
          ),
          const ChatInputSection(),
        ],
      ),
      drawer: const navigation_drawer.NavigationDrawer(),
    );
  }
}


