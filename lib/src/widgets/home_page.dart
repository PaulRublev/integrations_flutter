import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integrations_flutter/src/service.dart';
import 'package:integrations_flutter/src/platform/android/platform_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _service = PlatformService();
  // int _counter = 0;
  String _nativeText = '';
  // StreamSubscription? _subscription;

  void _getValue() async {
    _nativeText = await _service.callMethodChannel('Dva');
    setState(() {});
  }

  // void _getStream() async {
  //   _service.callEvent().listen((event) {
  //     setState(() {
  //       _counter = event;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_nativeText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: const PlatformWidget(),
            ),
            StreamBuilder(
              stream: _service.callEvent(),
              builder: (context, snapshot) {
                return Text(
                    snapshot.hasData ? snapshot.data.toString() : 'No data');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getValue,
        tooltip: 'Random',
        heroTag: null,
        child: const Icon(Icons.add),
      ),
    );
  }
}
