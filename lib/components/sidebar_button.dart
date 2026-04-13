import 'package:flutter/material.dart';
import 'package:just_tooltip/just_tooltip.dart';

class SidebarButton extends StatelessWidget {
  final Function()? onPressed;
  final Color backgroundColor;
  final String? note;
  final Widget icon;

  const SidebarButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    this.note,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          iconSize: 20,
          padding: const EdgeInsets.symmetric(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8)),
        ),
        child: JustTooltip(
            message: note,
            direction: TooltipDirection.right,
            child: icon,
            ));
  }
}
