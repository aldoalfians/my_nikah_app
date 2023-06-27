import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/screens/modules/booking/data/logic/blocs/booking_bloc/booking_bloc.dart';
import 'package:my_nikah_booking/screens/modules/booking/screens/done_booking.dart';
import 'package:my_nikah_booking/screens/modules/booking/widgets/inside_form.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:textless/textless.dart';

class InsideBookingScreen extends StatefulWidget {
  static const routeName = '/inside';

  const InsideBookingScreen({super.key});

  @override
  State<InsideBookingScreen> createState() => _InsideBookingScreenState();
}

class _InsideBookingScreenState extends State<InsideBookingScreen>
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
      backgroundColor: Colors.white,
      body: BlocBuilder<BookingBloc, BookingState>(
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
          if (state is BookingCompeleted) {
            Future.delayed(const Duration(seconds: 5));
            return const DoneBooking();
          }
          return CustomScrollView(
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
                            tag: "inside",
                            child: Image.asset(
                              ImagePath.insidetIllustration,
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
                          "Nikah di KUA".text.bold.size(20),
                          const SizedBox(
                            height: 8,
                          ),
                          const InsideForm(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
