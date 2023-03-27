import 'package:flutter/material.dart';
import 'package:my_nikah_booking/screens/main/screens/home/widgets/home_news_list.dart';
import 'package:textless/textless.dart';

import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:my_nikah_booking/screens/main/screens/home/widgets/home_adzan_card.dart';
import 'package:my_nikah_booking/screens/main/screens/home/widgets/home_booking_card.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Assalaamualaikum,'.text.size(14).regular,
              const SizedBox(height: 4),
              const Text(
                "Aldo Alfiansyah",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HomeAdzanCard(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    HomeBookingCard(
                      title: "Nikah di KUA",
                      imageSrc: ImagePath.pinIllustration,
                    ),
                    HomeBookingCard(
                      title: "Nikah diluar KUA",
                      imageSrc: ImagePath.routeIllustration,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const HomeNewsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
