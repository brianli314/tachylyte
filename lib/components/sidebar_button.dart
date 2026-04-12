import 'package:flutter/material.dart';
import 'package:just_tooltip/just_tooltip.dart';

class SidebarButton extends StatelessWidget {
  final Function()? onPressed;
  final int index;
  final int selectedIndex;
  const SidebarButton(
      {super.key,
      required this.onPressed,
      required this.index,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: selectedIndex == index
              ? Theme.of(context).colorScheme.tertiaryContainer
              : Theme.of(context).colorScheme.primaryContainer,
          iconSize: 20,
          padding: const EdgeInsets.symmetric(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8)),
        ),
        child: JustTooltip(
            message: "Notes",
            direction: TooltipDirection.right,
            child: Icon(
              Icons.note,
              color: Theme.of(context).colorScheme.inverseSurface,
            )));
  }
}
