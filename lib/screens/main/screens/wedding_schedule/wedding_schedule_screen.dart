import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/logic/bloc/detail_booking/detail_booking_bloc.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/weeding_detail_screen.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/widgets/wedding_detail_bottom_sheet.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/widgets/wedding_schedule_list.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/logic/blocs/booking_bloc/booking_bloc.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_outlined_button.dart';
import 'package:my_nikah_booking/widgets/modal_bootom_sheet.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:textless/textless.dart';

class WeddingScheduleScreen extends StatefulWidget {
  static const String routeName = '/schedule';
  const WeddingScheduleScreen({super.key});

  @override
  State<WeddingScheduleScreen> createState() => _WeddingScheduleScreenState();
}

class _WeddingScheduleScreenState extends State<WeddingScheduleScreen> {
  final BookingBloc bookingBloc = BookingBloc();
  final DetailBookingBloc detailBookingBloc = DetailBookingBloc();

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    bookingBloc.add(BookingListStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _onBookingButtonPressed(uuid) {
    //   BlocProvider.of<BookingBloc>(context)
    //       .add(BookingDetailPressed(uuid: uuid));
    //   context.rootNav().pushNamed(WeedingDetailScreen.routeName);
    // }

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
            children: [
              Expanded(
                child: BlocProvider(
                  create: (context) => bookingBloc,
                  child: BlocBuilder<BookingBloc, BookingState>(
                    bloc: bookingBloc,
                    builder: (context, state) {
                      if (state is BookingLoading) {
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
                      if (state is BookingListCompleted) {
                        var stateData = state.getBooking.data;
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          itemCount: stateData?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: InkWell(
                                onTap: () {
                                  detailBookingBloc.add(
                                    DetailBookingPressed(
                                        uuid: stateData?[index].uuid as String),
                                  );

                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return WeedingDetailScreen(
                                        uuid: stateData?[index].uuid as String,
                                      );
                                    }),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: const Color(0xFF5AB9FC)
                                          .withOpacity(0.1),
                                      child: Image.asset(
                                        stateData?[index].role == "in"
                                            ? ImagePath.pinIllustration
                                            : ImagePath.routeIllustration,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    title: Text(
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      stateData?[index].role == "out"
                                          ? "Di Luar KUA"
                                          : "Di Dalam KUA",
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          formatter.format(
                                            DateTime.parse(stateData?[index]
                                                .date as String),
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                      stateData?[index].status == "approve"
                                          ? "Diterima"
                                          : "Pending",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: stateData?[index].status ==
                                                "approve"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
