import 'package:flutter/material.dart';
import 'package:news_feed_neoflex/attached_personal_chat_page.dart';

class PersonalChatPage extends StatefulWidget {
  const PersonalChatPage({super.key, required this.userId});

  final String userId;

  @override
  _PersonalChatPageState createState() => _PersonalChatPageState();
}

class _PersonalChatPageState extends State<PersonalChatPage> {
  final List<Message> messages = [];
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(Message(
          text: _messageController.text,
          sender: 'Я',
          time: DateTime.now(),
        ));
        _messageController.clear();
      });
    }
  }

  void _showEmojiPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: GridView.count(
            crossAxisCount: 5,
            children: List.generate(20, (index) {
              return IconButton(
                icon: const Text('😊'),
                onPressed: () {
                  _messageController.text += '😊';
                  Navigator.pop(context);
                },
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AttachedPersonalChatPage(userId: widget.userId),
              ),
            );
          },
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                widget.userId,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message.sender == 'Я'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message.sender == 'Я'
                          ? Colors.blue[100]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: message.sender == 'Я'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(message.text),
                        const SizedBox(height: 5),
                        Text(
                          '${message.time.hour}:${message.time.minute.toString().padLeft(2, '0')}',
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _sendMessage,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Сообщение',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.emoji_emotions),
                        onPressed: () => _showEmojiPicker(context),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final String sender;
  final DateTime time;

  Message({required this.text, required this.sender, required this.time});
}
