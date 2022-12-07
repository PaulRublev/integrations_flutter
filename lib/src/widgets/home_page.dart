import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integrations_flutter/src/service.dart';

import '../platform/other/platform_widget.dart'
    if (dart.library.html) '../platform/web/platform_widget.dart'
    if (dart.library.io) '../platform/android/platform_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _service = getService();
  final TextEditingController _editingController =
      TextEditingController(text: '');
  // StreamSubscription? _subscription;

  void _setValue() async {
    await _service.callMethodChannel(_editingController.value.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PlatformWidget(),
            TextField(
              controller: _editingController,
              style: const TextStyle(fontWeight: FontWeight.w800),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setValue,
        tooltip: 'Random',
        heroTag: null,
        child: const Icon(Icons.add),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _subscription?.cancel();
  //   super.dispose();
  // }
}
