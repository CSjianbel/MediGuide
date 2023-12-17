import 'package:flutter/material.dart';

import 'package:mediguide/utils/theme_utils.dart';
import 'package:mediguide/utils/theme_constants.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/app_bar.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/user_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/bot_chat_bubble.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/navigation_drawer.dart'
    as navigation_drawer;

import 'package:http/http.dart' as http;
import 'dart:convert'; // For handling JSON data

class Message {
  String message;
  final bool bot;

  Message({required this.bot, required this.message});

  void setMessage(message) {
    this.message = message;
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String ip_address = "192.168.100.9";
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<Message> messages = [Message(bot: true, message: "")];

  void setBotMessage(int index, String message) {
    setState(() {
      messages[index].setMessage(message);
    });
  }

  Future<void> startChat() async {
    var url = Uri.parse("http://${ip_address}:8000/api/start");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body);
        setState(() {
          messages[0] = Message(bot: true, message: body['mediguide']);
        });
      } else {
        throw Exception('Failed to prompt MediGuide');
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  Future<void> promptMediGuide(String prev, int index) async {
    var url = Uri.parse("http://${ip_address}:8000/api/prompt");
    var requestBody = {"prompt": prev};

    try {
      var response = await http.post(url,
          body: json.encode(requestBody),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body);
        setState(() {
          messages[index] = Message(bot: true, message: body['mediguide']);
        });
      } else {
        throw Exception('Failed to prompt MediGuide');
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToEnd();
    });
    startChat();
  }

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
                      controller: scrollController,
                      padding: const EdgeInsets.all(15.0),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (messages[index].bot) {
                          return BotChatBubble(
                            message: messages[index].message,
                          );
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
                            messages.addAll([
                              Message(
                                  bot: false, message: messageController.text),
                              Message(bot: true, message: "")
                            ]);
                          });
                          promptMediGuide(
                              messageController.text, messages.length - 1);
                          FocusScope.of(context).unfocus();
                          messageController.text = '';
                          _scrollToEnd();
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

  void _scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    messageController.dispose();
  }
}
