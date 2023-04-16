import 'package:flutter/material.dart';

class AnnouncementMessageTile extends StatelessWidget {
  const AnnouncementMessageTile({required this.text,super.key});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text ?? '- waiting for message -',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
