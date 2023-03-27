import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_outlined_button.dart';
import 'package:textless/textless.dart';

class WeddingScheduleList extends StatelessWidget {
  const WeddingScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF5AB9FC).withOpacity(0.1),
                    child: Image.asset(
                      ImagePath.wishlistIllustration,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: 'Diluar KUA'.text.size(14).bold,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      "29 Juni 2022".text.size(14),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                  trailing: AppOutlinedButton(
                    child: "Detail".text.size(11),
                    type: OutlinedButtonType.primary,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
