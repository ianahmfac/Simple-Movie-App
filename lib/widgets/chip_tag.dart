import 'package:flutter/material.dart';

class ChipTag extends StatelessWidget {
  const ChipTag({
    Key? key,
    required this.title,
    this.onDeleted,
    this.textSize,
  }) : super(key: key);
  final String title;
  final VoidCallback? onDeleted;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      label: Text(
        title,
        style: TextStyle(
          fontSize: textSize,
          color: Colors.indigo,
        ),
      ),
      backgroundColor: Colors.amber.shade100,
      deleteIcon: Icon(Icons.clear, size: 18),
      deleteIconColor: Colors.red,
      onDeleted: onDeleted,
    );
  }
}
