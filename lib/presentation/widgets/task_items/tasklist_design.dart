import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  final String title;
  final String time;
  final String category;
  final int flagCount;
  final VoidCallback? onTap;

  const TaskListItem({
    Key? key,
    required this.title,
    required this.time,
    required this.category,
    required this.flagCount,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.radio_button_unchecked, color: theme.colorScheme.outline),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                      fontSize: 16,
                      color:theme.colorScheme.onPrimary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style:  TextStyle(
                      fontSize: 14,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                   Icon(Icons.grade, color: theme.colorScheme.onPrimary, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    category,
                    style:  TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.outline),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                   Icon(Icons.flag_outlined,
                      color: theme.colorScheme.outline, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '$flagCount',
                    style:  TextStyle(color: theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
