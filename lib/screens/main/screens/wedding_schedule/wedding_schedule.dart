import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';

class WeddingScheduleScreen extends StatelessWidget {
  static const String routeName = '/schedule';
  const WeddingScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Jadwal Nikah"),
        ),
        body: Center(
          child: Text("Jadwal Pernikahan"),
        ),
      ),
    );
  }
}
