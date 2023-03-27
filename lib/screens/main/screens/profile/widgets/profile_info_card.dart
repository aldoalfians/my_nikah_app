import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/utils/extension/extension.dart';
import 'package:textless/textless.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: ListTile(
              leading: Image.asset(
                ImagePath.usertIllustration,
              ),
              title: 'Aldo Alfiansyah'.text.size(16).semiBold,
              subtitle: "KPD21384757".text.bold.size(14).color(Colors.grey),
              trailing: Icon(
                Icons.edit,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
