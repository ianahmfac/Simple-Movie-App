import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle ?? '',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
