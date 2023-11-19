import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_utils.dart';
import 'package:mediguide/utils/theme_constants.dart';

class ChatInputSection extends StatelessWidget {
  const ChatInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Container(
      padding: const EdgeInsets.all(15.0),
      color: currentTheme.appBarTheme.backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeUtils.getIconBackground(currentTheme),
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
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: IconButton(
              icon: const Icon(Icons.send, color: lightForeground, size: 20),
              onPressed: () {
                // Add logic to send the message
              },
            ),
          ),
        ],
      ),
    );
  }
}