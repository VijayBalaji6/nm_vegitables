import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_rounded),
            padding: const EdgeInsets.only(right: 20, top: 5),
            onPressed: () {},
          ),
        ],
        elevation: 0.1,
      ),
      body: Center(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
