import 'package:flutter/material.dart';
import 'package:todo_app/presentation/widgets/task/card_widget.dart';
import '../../widgets/date/easy_datepicker_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Calendar"),
      ),
      body: Column(
        children: [
          EasyDatePickerWidget(
            onDateSelected: () {},
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Today"),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: const Text("Completed"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: const [
                TaskCard(
                  title: "Do Math Homework",
                  time: "Today At 16:45",
                  category: "University",
                  categoryColor: Colors.blue,
                  flagCount: 1,
                ),
                TaskCard(
                  title: "Tack out dogs",
                  time: "Today At 18:20",
                  category: "Home",
                  categoryColor: Colors.red,
                  flagCount: 2,
                ),
                TaskCard(
                  title: "Business meeting with CEO",
                  time: "Today At 08:15",
                  category: "Work",
                  categoryColor: Colors.orange,
                  flagCount: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
