import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';
import 'package:textless/textless.dart';

class HomeBookingCard extends StatelessWidget {
  final String title;
  final String imageSrc;
  final void Function()? onTap;

  const HomeBookingCard({
    Key? key,
    required this.title,
    required this.imageSrc,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-3, 2),
            spreadRadius: -5,
            blurRadius: 22,
            color: Color.fromRGBO(152, 152, 152, 0.62),
          ),
        ],
      ),
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: context.secondaryColor,
                  child: Image.asset(
                    imageSrc,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Booking".text.bold.size(12),
                    title.text.bold.size(16).color(context.primaryColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
