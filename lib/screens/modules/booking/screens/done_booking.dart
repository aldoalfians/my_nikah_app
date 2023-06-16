import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_nikah_booking/screens/main/main_tab_screen.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/wedding_schedule_screen.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';
import 'package:my_nikah_booking/widgets/app_outlined_button.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:textless/textless.dart';

class DoneBooking extends StatelessWidget {
  const DoneBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/animations/donebook.json",
              repeat: true,
            ),
            "Pesanan anda berhasil akan segera diproses".text.semiBold.size(18),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppOutlinedButton(
                large: true,
                child: "Lihat Pesanan".text,
                type: OutlinedButtonType.primary,
                onPressed: () =>
                    context.rootNav().pushNamed(MainTabScreen.routeName),
              ),
            )
          ],
        ),
      ),
    );
  }
}
