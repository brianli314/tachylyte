import 'package:flutter/material.dart';
import 'dart:io';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});

  @override
  State<FileExplorer> createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  

  getDirFiles(Directory dir){
    await for (var entity in dir.list()){
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}