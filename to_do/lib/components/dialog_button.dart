import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String? label;
  final Function()? onTap;
  final Color? color;
  final Widget? icon;
  const DialogButton({
    super.key,
    this.label,
    this.onTap,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: color ?? Colors.grey[400],
      onPressed: onTap ?? () => Navigator.pop(context),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: icon ??
          Text(
            label!,
            style: TextStyle(
              color: label == 'Cancel' ? Colors.black : Colors.white,
              fontSize: 14,
            ),
          ),
    );
  }
}
