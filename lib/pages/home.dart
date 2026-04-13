import 'package:flutter/material.dart';
import 'package:just_tooltip/just_tooltip.dart';
import 'package:tachylyte/components/sidebar_button.dart';
import 'package:tachylyte/pages/notes.dart';

class HomePage extends StatefulWidget {
  final String vaultPath;
  const HomePage({super.key, required this.vaultPath});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
            width: 45,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 6.5),
              children: [
                const SizedBox(height: 15),
                SidebarButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    note: "Notes",
                    backgroundColor: _selectedIndex == 0
                        ? Theme.of(context).colorScheme.tertiaryContainer
                        : Theme.of(context).colorScheme.primaryContainer,
                    icon: Icon(
                      Icons.edit_note_outlined,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    )),
                const SizedBox(height: 15),
                SidebarButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  backgroundColor: _selectedIndex == 1
                      ? Theme.of(context).colorScheme.tertiaryContainer
                      : Theme.of(context).colorScheme.primaryContainer,
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                  note: "Settings",
                ),
              ],
            )),
        const SizedBox(
          width: 3,
        ),
        NotesPage(vaultPath: widget.vaultPath)
      ],
    ));
  }
}
