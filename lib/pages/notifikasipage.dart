import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartpos/components/sidebar.dart';
import 'package:smartpos/theme.dart';

class Notification {
  final String title;
  final String message;
  final DateTime timestamp;

  Notification(
      {required this.title, required this.message, required this.timestamp});
}

List<Notification> notifications = [
  Notification(
    title: "New order received",
    message: "Order #1234 has been received",
    timestamp: DateTime.now(),
  ),
  Notification(
    title: "Inventory low",
    message: "Item X is running low on stock",
    timestamp: DateTime.now(),
  ),
  Notification(
    title: "Daily summary",
    message: "Today's sales summary is now available",
    timestamp: DateTime.now(),
  ),
];

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi"),
        backgroundColor: primaryBlue,
      ),
      drawer: const SideBar(),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.message),
            trailing: Text(
              DateFormat('yyyy-MM-dd kk:mm').format(notification.timestamp),
            ),
          );
        },
      ),
    );
  }
}
