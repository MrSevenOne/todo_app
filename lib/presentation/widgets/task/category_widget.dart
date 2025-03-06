import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDialog extends StatefulWidget {
  @override
  _CategoryDialogState createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  int? selectedIndex;

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Grocery',
      'icon': Icons.local_grocery_store,
      'color': Colors.lightGreenAccent
    },
    {'name': 'Work', 'icon': Icons.work, 'color': Colors.redAccent},
    {'name': 'Sport', 'icon': Icons.fitness_center, 'color': Colors.cyanAccent},
    {'name': 'Design', 'icon': Icons.games, 'color': Colors.greenAccent},
    {'name': 'University', 'icon': Icons.school, 'color': Colors.blueAccent},
    {'name': 'Social', 'icon': Icons.campaign, 'color': Colors.pinkAccent},
    {'name': 'Music', 'icon': Icons.music_note, 'color': Colors.pinkAccent},
    {
      'name': 'Health',
      'icon': Icons.health_and_safety,
      'color': Colors.lightGreenAccent
    },
    {'name': 'Movie', 'icon': Icons.movie, 'color': Colors.lightBlueAccent},
    {'name': 'Home', 'icon': Icons.home, 'color': Colors.redAccent},
    {'name': 'Create New', 'icon': Icons.add, 'color': Colors.greenAccent},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.cardColor,
      title: Text(
        "Choose Category",
        style: TextStyle(
            color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: theme.colorScheme.outline,
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 300.h, // Dialog ichida GridView balandligi
            width: double.maxFinite,
            child: GridView.count(
              crossAxisCount: 3,
              // Har qatorga 3 tadan element
              crossAxisSpacing: 10.h,
              mainAxisSpacing: 10.w,
              shrinkWrap: true,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: categories[index]['color'],
                      borderRadius: BorderRadius.circular(10),
                      border: selectedIndex == index
                          ? Border.all(color: Colors.white, width: 2)
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          categories[index]['icon'],
                          size: 30,
                          color: theme.scaffoldBackgroundColor,
                        ),
                        SizedBox(height: 5),
                        Text(categories[index]['name'],
                            style: TextStyle(
                                color: theme.scaffoldBackgroundColor,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).primaryColor)),
        ),
        ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: selectedIndex == null
              ? null
              : () {
                  Navigator.pop(context, categories[selectedIndex!]['name']);
                },
          child: Text(
            "Edit",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}

void showCategoryDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => CategoryDialog(),
  ).then((selectedCategory) {
    if (selectedCategory != null) {
      print("Selected Category: $selectedCategory");
    }
  });
}
