import 'package:flutter/material.dart';
import 'package:taskati/feature/home/widget/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [CustomAppBar()]),
        ),
      ),
    );
  }
}
