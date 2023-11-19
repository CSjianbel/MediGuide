
import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_utils.dart';

class CustomChatHistoryTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const CustomChatHistoryTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                // Your onPressed logic here
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Row(
                children: [
                  Icon(Icons.message_outlined, size: 14, color: ThemeUtils.getForeground(currentTheme),),
                  const SizedBox(width: 10.0), // Adjust spacing as needed
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: ThemeUtils.getForeground(currentTheme)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // delete button onPressed logic here
            },
            icon: const Icon(Icons.delete_outline_outlined, size: 14, color: Color(0xFFFF5959)),
          )
        ],
      ),
    );
  }
}
