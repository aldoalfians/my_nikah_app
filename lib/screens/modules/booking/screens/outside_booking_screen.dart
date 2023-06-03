import 'package:flutter/material.dart';
import 'package:my_nikah_booking/screens/modules/booking/widgets/outside_form.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:textless/textless.dart';

class OutsideBookingScreen extends StatefulWidget {
  static const routeName = '/outside';

  const OutsideBookingScreen({super.key});

  @override
  State<OutsideBookingScreen> createState() => _OutsideBookingScreenState();
}

class _OutsideBookingScreenState extends State<OutsideBookingScreen>
    with TickerProviderStateMixin {
  static const _bgTopHeight = 327.0;

  late AnimationController _animationController;
  late ScrollController _scrollController;
  Animation? _appBarBgColorTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 0) {
          _animationController
              .animateTo(_scrollController.offset / _bgTopHeight);
        } else {
          _animationController.animateTo(0);
        }
      });

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _appBarBgColorTween = ColorTween(
        begin: Theme.of(context).primaryColor.withOpacity(0),
        end: Theme.of(context).primaryColor,
      ).animate(_animationController);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return SliverAppBar(
                floating: false,
                pinned: false,
                expandedHeight: _bgTopHeight,
                backgroundColor: _appBarBgColorTween?.value ??
                    Theme.of(context).primaryColor,
                flexibleSpace: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: "outside",
                        child: Image.asset(
                          ImagePath.outsidetIllustration,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 33,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                      ),
                      bottom: -7,
                      left: 0,
                      right: 0,
                    ),
                  ],
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      "Nikah di luar KUA".text.bold.size(20),
                      const SizedBox(
                        height: 8,
                      ),
                      const OustsideForm(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
