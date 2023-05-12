import 'package:flutter/material.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/theme.dart';
import 'package:intl/intl.dart';

class Message {
  final String image;
  final String sender;
  final String messageText;
  final DateTime timestamp;
  final bool isActive;

  Message({
    required this.image,
    required this.sender,
    required this.messageText,
    required this.timestamp,
    this.isActive = false,
  });
}

List<Message> messages = [
  Message(
    image:
        "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
    sender: "Marcella",
    messageText: "Hello Mary, can you check if we have stock of Item X?",
    timestamp: DateTime.now(),
    isActive: true,
  ),
  Message(
    image:
        "https://images.unsplash.com/photo-1681742030245-2efc2f04ef9c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
    sender: "Faisal",
    messageText: "Sure John, let me check for you.",
    timestamp: DateTime.now(),
  ),
  Message(
    image:
        "https://images.unsplash.com/photo-1682247297864-54de4ed02804?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
    sender: "Indra",
    messageText: "Thanks Mary, I appreciate it!",
    timestamp: DateTime.now(),
    isActive: true,
  ),
];

class PesanPage extends StatelessWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesan"),
        backgroundColor: primaryBlue,
      ),
      drawer: const SideBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(
                  15.0,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(message.image),
                        ),
                        if (message.isActive)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: primaryBlue,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.sender,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Opacity(
                              opacity: 0.64,
                              child: Text(
                                message.messageText,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        DateFormat('yyyy-MM-dd kk:mm')
                            .format(message.timestamp),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
