import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/logic/bloc/detail_booking/detail_booking_bloc.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:textless/textless.dart';

class WeedingDetailScreen extends StatefulWidget {
  static const routeName = '/detailWeeding';

  final String uuid;
  const WeedingDetailScreen({super.key, required this.uuid});

  @override
  State<WeedingDetailScreen> createState() =>
      _WeedingDetailScreenState(uuid: uuid);
}

class _WeedingDetailScreenState extends State<WeedingDetailScreen> {
  final String uuid;
  final DetailBookingBloc detailBookingBloc = DetailBookingBloc();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  _WeedingDetailScreenState({required this.uuid});

  @override
  void initState() {
    detailBookingBloc.add(DetailBookingPressed(uuid: uuid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: BlocProvider(
        create: (context) => detailBookingBloc,
        child: BlocBuilder<DetailBookingBloc, DetailBookingState>(
          bloc: detailBookingBloc,
          builder: (context, state) {
            if (state is DetailBookingLoading) {
              return Scaffold(
                body: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.amberAccent,
                          ),
                          strokeWidth: 4.0,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }

            if (state is DetailBookingCompleted) {
              return Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/splash-screen/my-nikah.png",
                            height: 200,
                            width: 200,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: context.theme.cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Jadwal Pernikahan"
                                    .text
                                    .bold
                                    .size(22)
                                    .color(context.primaryColor),
                                (state.bookingDetail.status == "approve"
                                        ? "Diterima"
                                        : "Pending")
                                    .text
                                    .semiBold
                                    .size(20)
                                    .color(
                                      state.bookingDetail.status == "approve"
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                              ],
                            ),
                            Card(
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
                                    title: '${state.bookingDetail.user?.name}'
                                        .text
                                        .size(20)
                                        .semiBold
                                        .color(context.primaryColor),
                                    subtitle:
                                        '${state.bookingDetail.user?.email}'
                                            .text
                                            .semiBold
                                            .size(16),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Tempat"
                                    .text
                                    .size(18)
                                    .semiBold
                                    .color(context.primaryColor),
                                (state.bookingDetail.role == "in"
                                        ? "Didalam KUA"
                                        : "Diluar KUA")
                                    .text
                                    .size(18)
                                    .semiBold
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Jam"
                                    .text
                                    .size(18)
                                    .semiBold
                                    .color(context.primaryColor),
                                '${state.bookingDetail.hours}'
                                    .text
                                    .size(18)
                                    .semiBold
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Tanggal"
                                    .text
                                    .size(18)
                                    .semiBold
                                    .color(context.primaryColor),
                                formatter
                                    .format(
                                      DateTime.parse(
                                          state.bookingDetail.date as String),
                                    )
                                    .text
                                    .size(18)
                                    .semiBold
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.amberAccent,
                        ),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
