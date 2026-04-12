import 'package:file_tree_view/file_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';

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
            onHoverExit: () => setState(() => hovered = false),
            thickness: 3,
            cursor: SystemMouseCursors.resizeColumn,
            color: hovered ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.surface
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: SingleChildScrollView(
              child: DirectoryTreeViewer(
                rootPath: widget.vaultPath,
                enableCreateFileOption: true,
                enableCreateFolderOption: true
              ),
            ),
          ),
        ),
        ResizableChild(
            child: Container(color: Theme.of(context).colorScheme.surface))
      ]),
    );
  }
}
