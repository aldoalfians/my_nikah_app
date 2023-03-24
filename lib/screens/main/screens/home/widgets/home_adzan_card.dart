import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/widgets/theme_invert.dart';
import 'package:my_nikah_booking/utils/extension/extension.dart';
import 'package:textless/textless.dart';

class HomeAdzanCard extends StatelessWidget {
  const HomeAdzanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeInvert(
      child: Card(
        clipBehavior: Clip.none,
        color: context.primaryColor,
        child: IntrinsicHeight(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: context.secondaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        context.primaryColor.lighten(0.10),
                        context.primaryColor.lighten(0.15),
                        context.primaryColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              'Dzuhur'.text.bold.size(16),
                              const SizedBox(width: 8),
                              '00:12:56'.text,
                            ],
                          ),
                          Row(
                            children: [
                              '12:09'.text.bold.size(24),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.volume_down,
                                size: 34,
                              )
                            ],
                          ),
                          Divider(
                            height: 18,
                            thickness: 1,
                            color: context.cardColor.withOpacity(0.5),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Lokasi saat ini '),
                                      TextSpan(
                                        text: 'Tangerang Selatan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 140)
                ],
              ),
              Positioned(
                top: -8,
                right: 8,
                child: Image.asset(
                  ImagePath.bedugIllustration,
                  fit: BoxFit.contain,
                  height: 148,
                  width: 140,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
