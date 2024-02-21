import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:to_do/Services/task_services.dart';

class HeadingContent extends StatelessWidget {
  const HeadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('EEEE, d MMMM', 'en_US').format(DateTime.now());
    String userName = userInfo.get('name');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterChip(
          avatar: const Text('Hey,'),
          label: Text(userName),
          onSelected: (bool val) => val,
        ),
        // RichText(
        //   text: TextSpan(
        //     text: 'Hey, ',
        //     style: style(size: 19, color: Colors.grey[400]),
        //     children: [
        //       TextSpan(
        //         text: userName,
        //         style: style(
        //           color: Colors.grey[300],
        //           weight: FontWeight.w500,
        //           size: 20,
        //           letterSpacing: 0,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Text(
        //   'Completed your tasks !!!',
        //   style: style(
        //     size: 19,
        //     color: Colors.grey[400],
        //     wordSpacing: 3,
        //     letterSpacing: 2,
        //   ),
        // ),
        // const SizedBox(),
        // Text(
        //   'Today',
        //   style: style(
        //     color: Colors.grey[300],
        //     size: 20,
        //     weight: FontWeight.w600,
        //     letterSpacing: 0,
        //   ),
        // ),
        // Text(
        //   today,
        //   style: style(
        //     color: Colors.grey[400],
        //     wordSpacing: 3,
        //     weight: FontWeight.w500,
        //     size: 14,
        //   ),
        // ),
      ],
    ).animate().slideX();
  }
}

TextStyle style({
  Color? color,
  double? size,
  FontWeight? weight,
  double? wordSpacing,
  double? letterSpacing,
  TextDecoration? decoration,
}) {
  return TextStyle(
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    decoration: decoration,
    decorationColor: Colors.grey[500],
    color: color ?? const Color(0xF5FFFFFF),
    fontSize: size ?? 14,
    fontWeight: weight ?? FontWeight.w400,
  );
}
