import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/logic/bloc/detail_booking/detail_booking_bloc.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/modal_bottom_sheet_container.dart';
import 'package:textless/textless.dart';

class WeddingDetailBottomSheet extends StatelessWidget {
  WeddingDetailBottomSheet({super.key});

  final DetailBookingBloc detailBookingBloc = DetailBookingBloc();

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetContainer(
      height: 380,
      child: BlocProvider(
        create: (context) => detailBookingBloc,
        child: BlocBuilder<DetailBookingBloc, DetailBookingState>(
          bloc: detailBookingBloc,
          builder: (context, state) {
            if (state is DetailBookingLoading) {
              return Container(
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
              );
            }

            if (state is DetailBookingCompleted) {
              state.bookingDetail.date;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "${state.bookingDetail.date}"
                          .text
                          .bold
                          .size(18)
                          .color(context.primaryColor),
                      "Approved".text.size(14).color(
                            Colors.green,
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
                          leading: Image.asset(
                            'assets/images/icons/pouch_icon.svg',
                          ),
                          title: 'Total Pinjaman'
                              .text
                              .size(12)
                              .semiBold
                              .color(context.primaryColor),
                          subtitle: "Rp. 5.000.000"
                              .text
                              .bold
                              .size(20)
                              .color(context.secondaryColor),
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
                      "Sisa Bulan".text.size(14).color(context.primaryColor),
                      "7 Bulan"
                          .text
                          .size(16)
                          .semiBold
                          .color(context.secondaryColor),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Tagihan Perbulan"
                          .text
                          .size(14)
                          .color(context.primaryColor),
                      "560.000"
                          .text
                          .size(16)
                          .semiBold
                          .color(context.secondaryColor),
                    ],
                  ),
                ],
              );
            }

            return Container(
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
            );
          },
        ),
      ),
    );
  }
}
