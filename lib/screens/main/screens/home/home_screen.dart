import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/data/models/get_user.dart';
import 'package:my_nikah_booking/logic/blocs/get_user_bloc/get_user_bloc.dart';
import 'package:my_nikah_booking/screens/main/screens/home/widgets/home_news_list.dart';
import 'package:my_nikah_booking/screens/modules/booking/screens/inside_booking.dart';
import 'package:my_nikah_booking/screens/modules/booking/screens/outside_booking_screen.dart';
import 'package:textless/textless.dart';

import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:my_nikah_booking/screens/main/screens/home/widgets/home_adzan_card.dart';
import 'package:my_nikah_booking/screens/main/screens/home/widgets/home_booking_card.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetUserBloc _getUserBloc = GetUserBloc();

  @override
  void initState() {
    _getUserBloc.add(GetDataUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: BlocProvider(
            create: (context) => _getUserBloc,
            child: BlocBuilder<GetUserBloc, GetUserState>(
              bloc: _getUserBloc,
              builder: (context, state) {
                if (state is GetUserInitial) {
                  return "Loading".text;
                } else if (state is GetUserLoading) {
                  return "Loading".text;
                } else if (state is GetUserLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Selamat Datang,'.text.size(14).regular,
                      const SizedBox(height: 4),
                      Text(
                        "${state.getUser.name}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                } else if (state is GetUserFailure) {
                  return "Loading & Error".text;
                } else {
                  return "Loading".text;
                }
              },
            ),
          ),
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
                  children: [
                    HomeBookingCard(
                      title: "Nikah di KUA",
                      imageSrc: ImagePath.pinIllustration,
                      onTap: () => context
                          .rootNav()
                          .pushNamed(InsideBookingScreen.routeName),
                    ),
                    HomeBookingCard(
                      title: "Nikah diluar KUA",
                      imageSrc: ImagePath.routeIllustration,
                      onTap: () => context
                          .rootNav()
                          .pushNamed(OutsideBookingScreen.routeName),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
