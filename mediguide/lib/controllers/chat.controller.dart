import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  /*
   * Create a new chat
   */
  Future<void> createChat() async {
    try {
      _validateUser();

      await db.collection('users').doc(user!.uid).collection('chats').add({});
    } catch (e) {
      throw 'An error occured while creating a chat.';
    }
  }

  /*
  * User sends a message
  */
  Future<void> sendMessage(message, chatUid) async {
    try {
      await db
          .collection('users')
          .doc(user!.uid)
          .collection('chats')
          .doc(chatUid)
          .collection('messages')
          .add(
              {'message': message, 'bot': false, 'timestamp': Timestamp.now()});
    } catch (e) {
      throw 'An error occured while sending a message as user';
    }
  }

  /*
   * Ollama sends a message
   */
  Future<void> ollamaMessage(message, chatUid) async {
    try {
      await db
          .collection('users')
          .doc(user!.uid)
          .collection('chats')
          .doc(chatUid)
          .collection('messages')
          .add(
              {'message': message, 'bot': false, 'timestamp': Timestamp.now()});
    } catch (e) {
      throw 'An error occured while sending a message as ollama';
    }
  }

  void _validateUser() {
    if (user == null) {
      throw 'User not authenticated.';
    }
  }
}
