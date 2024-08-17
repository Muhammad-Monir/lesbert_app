import 'package:flutter/material.dart';

class ProSubscriptionScreen extends StatefulWidget {
  const ProSubscriptionScreen({super.key});

  @override
  State<ProSubscriptionScreen> createState() => _ProSubscriptionScreenState();
}

class _ProSubscriptionScreenState extends State<ProSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Subscription'),
      ),
    );
  }
}
