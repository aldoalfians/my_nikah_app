import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:my_nikah_booking/widgets/app_elevated_button.dart';
import 'package:textless/textless.dart';

class OustsideForm extends StatefulWidget {
  const OustsideForm({super.key});

  @override
  State<OustsideForm> createState() => _OustsideFormState();
}

class _OustsideFormState extends State<OustsideForm> {
  final _nameController = TextEditingController();
  final _priceController =
      NumberFormat.simpleCurrency(locale: 'ID-id', decimalDigits: 2)
          .format(600000);
  final _roleController = "out";
  late String _hourController;
  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle_sharp),
              labelText: "Name",
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
            controller: _nameController,
            keyboardType: TextInputType.text,
            autocorrect: false,
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.access_time_filled_rounded),
              labelText: "Jam Booking",
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
              labelText: "Tanggal Booking",
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
                  initialValue: _roleController,
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
                  initialValue: _priceController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          AppElevatedButton(
            large: true,
            type: ElevatedButtonType.primary,
            onPressed: () {},
            child: "Booking Sekarang".text,
          ),
        ],
      ),
    );
  }
}
