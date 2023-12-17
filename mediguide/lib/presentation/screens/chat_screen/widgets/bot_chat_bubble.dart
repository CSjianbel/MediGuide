import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_utils.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/typing_indicator.dart';

class BotChatBubble extends StatelessWidget {
  final String message;

  const BotChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset("assets/images/Logo.png",
                  width: 25, height: 25, fit: BoxFit.fitWidth),
            ),
            const SizedBox(width: 10.0),
            Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.7, // Set the maximum width here
                ),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: currentTheme.appBarTheme.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: (message.isEmpty)
                    ? const TypingIndicator()
                    : Text(message,
                        style: const TextStyle(
                            fontFamily: 'Poppins', fontSize: 12))),
          ],
        ),
      ),
    );
  }
}

              // FutureBuilder(
              //   future: fetchMessage(lastMessage),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       // TODO: Change into typing indicator
              //       return const CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       final String message = snapshot.data!['mediguide'];
              //       setBotMessage(index, message);
              //       return Text(message,
              //           style: const TextStyle(
              //               fontFamily: 'Poppins', fontSize: 12));
              //     }
              //   },
              // ),

  // final int index;
  // final Future<Map<String, dynamic>> Function(String) fetchMessage;
  // final Function(int, String) setBotMessage;
  // final String lastMessage;