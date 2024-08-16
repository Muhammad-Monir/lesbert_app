import 'package:flutter/material.dart';

class ProMessageScreen extends StatefulWidget {
  const ProMessageScreen({super.key});

  @override
  State<ProMessageScreen> createState() => _ProMessageScreenState();
}

class _ProMessageScreenState extends State<ProMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Dashboard'),
      ),
    );
  }
}
