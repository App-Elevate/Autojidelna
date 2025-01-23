import 'package:autojidelna/src/logic/change_date.dart';
import 'package:flutter/material.dart';

class JumpToTodayButton extends StatelessWidget {
  const JumpToTodayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: MaterialButton(
        textColor: Theme.of(context).colorScheme.onSurfaceVariant,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).colorScheme.onSurfaceVariant, width: 1.75),
        ),
        onPressed: () => changeDate(context, DateTime.now(), animate: true),
        child: Text(DateTime.now().day.toString()),
      ),
    );
  }
}
