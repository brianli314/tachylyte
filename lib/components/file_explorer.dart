import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class FileExplorer extends StatelessWidget {
  final String vaultPath;

  const FileExplorer({
    super.key,
    required this.vaultPath,
  });

  List<Widget> _buildNodes(Directory dir) {
    final children = <Widget>[];

    for (final entity in dir.listSync()) {
      final name = p.basename(entity.path);

      if (entity is File && p.extension(name) == '.md') {
        children.add(
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.note_outlined),
            title: Text(name),
            dense: true,
          ),
        );
      } else if (entity is Directory) {
        children.add(
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.only(left: 20),
              leading: const SizedBox.shrink(),
              title: Row(
                children: [
                  const SizedBox(width: 4),
                  Text(name),
                ],
              ),
              children: _buildNodes(entity),
            ),
          ),
        );
      }
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildNodes(Directory(vaultPath)),
    );
  }
}