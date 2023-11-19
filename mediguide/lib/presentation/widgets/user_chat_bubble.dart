import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_constants.dart';

class UserChatBubble extends StatelessWidget {
  final String message;

  const UserChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: screenWidth * 0.7, // Set the maximum width here
              ),
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(2.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: lightForeground),
              ),
            ),
          ],
        ),
      ),
    );
  }
}