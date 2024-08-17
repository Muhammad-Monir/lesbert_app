import 'package:flutter/material.dart';

class ProProfileScreen extends StatefulWidget {
  const ProProfileScreen({super.key});

  @override
  State<ProProfileScreen> createState() => _ProProfileScreenState();
}

class _ProProfileScreenState extends State<ProProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Profile'),
      ),
    );
  }
}
