import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:my_nikah_booking/screens/main/screens/profile/widgets/profile_info_card.dart';
import 'package:textless/textless.dart';
import 'package:my_nikah_booking/widgets/app_outlined_button.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Profile"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileInfoCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AppOutlinedButton(
                large: true,
                child: "Logout".text,
                type: OutlinedButtonType.primary,
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
