import 'package:flutter/material.dart';
import 'package:flutter_module/src/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _service = PlatformService();
  int num = -1;

  void _getValue() async {
    num = await _service.callMethodChannel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Text('Native random number: $num'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getValue,
        tooltip: 'get number',
        heroTag: null,
        child: const Icon(Icons.arrow_circle_down),
      ),
    );
  }
}
