import 'package:flutter/cupertino.dart';

class BirthdatePicker extends StatelessWidget {
  const BirthdatePicker({
    required this.onDateChanged,
    super.key,
  });

  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        onDateTimeChanged: onDateChanged,
        initialDateTime: DateTime(now.year - 18, now.month, now.day),
        minimumYear: now.year - 120,
        maximumYear: now.year - 8,
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
