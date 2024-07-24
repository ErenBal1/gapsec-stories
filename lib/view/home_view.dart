import 'package:flutter/material.dart';
import 'package:gapsec/utils/app_font.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("selam Eren", style: AppFonts.norm),
      ),
    );
  }
}
