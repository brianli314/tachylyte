import 'package:flutter/material.dart';
import 'package:just_tooltip/just_tooltip.dart';
import 'package:tachylyte/components/sidebar_button.dart';
import 'package:tachylyte/pages/notes.dart';

class HomePage extends StatefulWidget {
  final String vaultPath;
  const HomePage({
    super.key, 
    required this.vaultPath 
  });

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
                          _selectedIndex = 1;
                        });
                      }, 
                      index: 0, 
                      selectedIndex: _selectedIndex
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        overlayColor: Theme.of(context).colorScheme.inversePrimary,
                        backgroundColor:
                            _selectedIndex == 1 ? Theme.of(context).colorScheme.tertiaryContainer : Theme.of(context).colorScheme.primaryContainer,
                        iconSize: 20,
                        padding: const EdgeInsets.symmetric(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8)),
                      ),
                      child: JustTooltip(
                          message: "Settings",
                          direction: TooltipDirection.right,
                          child: Icon(
                            Icons.settings,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          )),
                    )
                  ],
                )),
            const SizedBox(width: 2,),
            NotesPage(vaultPath: widget.vaultPath)
          ],
        ));
  }
}
