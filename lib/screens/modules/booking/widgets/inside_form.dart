import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/logic/blocs/booking_bloc/booking_bloc.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';
import 'package:textless/textless.dart';

class InsideForm extends StatefulWidget {
  const InsideForm({super.key});

  @override
  State<InsideForm> createState() => _InsideFormState();
}

class _InsideFormState extends State<InsideForm> {
  final _priceController = 0;
  final _roleController = "in";
  late String _hourController;
  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onBookingButtonPressed() {
      BlocProvider.of<BookingBloc>(context).add(
        BookingButtonPressed(
            hours: _hourController,
            date: dateCtl.text,
            price: _priceController.toInt(),
            role: _roleController),
      );
    }

    return BlocListener<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is BookingFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Pesanan anda tidak dapat di proses"),
              backgroundColor: context.errorColor,
            ),
          );
        }
      },
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          return Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.access_time_filled_rounded),
                    labelText: "Jam",
                    labelStyle: context.theme.textTheme.bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ),
                  items: [
                    "08:00-10:00 Pagi",
                    "10:00-12:00 Siang",
                    "13:00-15:00 Siang",
                    "19:00-21:00 Malam"
                  ]
                      .map(
                        (hour) => DropdownMenuItem(
                          value: hour,
                          child: hour.text,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _hourController = value as String;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month_rounded),
                    labelText: "Tanggal",
                    labelStyle: context.theme.textTheme.bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ),
                  controller: dateCtl,
                  onTap: () async {
                    DateTime? date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    dateCtl.text = date?.toIso8601String() as String;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFormField(
                        enabled: false,
                        readOnly: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                        ),
                        initialValue: "Di KUA",
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                          enabled: false,
                          readOnly: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          initialValue: "Gratis"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  child: state is BookingLoading
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(
                                      backgroundColor: context.backgroundColor,
                                      color: context.primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            AppElevatedButton(
                              large: true,
                              type: ElevatedButtonType.primary,
                              onPressed: _onBookingButtonPressed,
                              child: "Booking Sekarang".text,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
