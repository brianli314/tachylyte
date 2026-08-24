import 'package:file_tree_view/file_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:tachylyte/components/file_explorer.dart';

class NotesPage extends StatefulWidget {
  final String vaultPath;
  const NotesPage({super.key, required this.vaultPath});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ResizableContainer(direction: Axis.horizontal, children: [
        ResizableChild(
          size: const ResizableSize.ratio(0.15),
          divider: ResizableDivider(
            onHoverEnter: () => setState(() => hovered = true),
            onDragStart: () => setState(() => hovered = true),
            onDragEnd: () => setState(() => hovered = true),
            onHoverExit: () => setState(() => hovered = false),
            thickness: 3,
            cursor: SystemMouseCursors.resizeColumn,
            color: hovered ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.surface
          ),
          child: FileExplorer(vaultPath: widget.vaultPath)
        ),
        ResizableChild(child: Container())
      ]),
    );
  }
}
