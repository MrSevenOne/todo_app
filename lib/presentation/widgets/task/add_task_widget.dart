import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/constants.dart';
import 'package:todo_app/presentation/widgets/date/datepicker_widget.dart';

class AddTaskWidget {
  static void show(BuildContext context,
      {required String title, required String content}) {
    showBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 5.0,
              right: 5.0,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(deffaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14.0,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Do math homework'),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  Row(
                    spacing: 16.h,
                    children: [
                      IconButton(
                        onPressed: () => DatePickerWidget.selectDate(context),
                        icon: Icon(
                          Icons.timer,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          DatePickerWidget.selectTime(context);
                        },
                        icon: Icon(
                          Icons.task,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flag_outlined,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
