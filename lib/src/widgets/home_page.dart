import 'package:flutter/material.dart';
import 'package:integrations_flutter/src/pigeon.dart';

import 'platform_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _editingController =
      TextEditingController(text: 'init');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const PlatformWidget(),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _editingController,
                style: const TextStyle(fontWeight: FontWeight.w800),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _setText(_editingController.value.text);
        },
        tooltip: 'set label text',
        heroTag: null,
        child: const Icon(Icons.arrow_circle_up),
      ),
    );
  }

  void _setText(String text) async {
    await ServiceApi().setLabelText(text);
  }
}
