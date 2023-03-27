import 'package:flutter/material.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/widgets/wedding_schedule_list.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [WeddingScheduleList()],
          ),
        ),
      ),
    );
  }
}
