import 'package:flutter/material.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import '../../../helpers/all_routes.dart';

class ProDashboardScreen extends StatefulWidget {
  const ProDashboardScreen({super.key});

  @override
  State<ProDashboardScreen> createState() => _ProDashboardScreenState();
}

class _ProDashboardScreenState extends State<ProDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                NavigationService.navigateTo(Routes.viewProfile);
              },
              child:const Text('View Profile'))
        ],
      ),
    );
  }
}
