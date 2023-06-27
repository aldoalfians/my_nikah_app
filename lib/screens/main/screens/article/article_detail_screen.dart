import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/screens/main/screens/article/logic/bloc/detail_article.dart/detail_article_bloc.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/logic/bloc/detail_booking/detail_booking_bloc.dart';
import 'package:textless/textless.dart';

class ArticleDetailScreen extends StatefulWidget {
  final String uuid;

  const ArticleDetailScreen({super.key, required this.uuid});

  @override
  State<ArticleDetailScreen> createState() =>
      _ArticleDetailScreenState(uuid: uuid);
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen>
    with TickerProviderStateMixin {
  final String uuid;
  final DetailArticleBloc detailArticleBloc = DetailArticleBloc();

  _ArticleDetailScreenState({required this.uuid});

  static const _bgTopHeight = 327.0;

  late AnimationController _animationController;
  late ScrollController _scrollController;
  Animation? _appBarBgColorTween;

  @override
  void initState() {
    detailArticleBloc.add(DetailArticlePressed(uuid: uuid));
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
      body: BlocProvider(
        create: (context) => detailArticleBloc,
        child: BlocBuilder<DetailArticleBloc, DetailArticleState>(
          builder: (context, state) {
            if (state is DetailArticleLoading) {
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

            if (state is DetailArticleCompleted) {
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
                                tag: "${state.detailArticle.uuid}",
                                child: Image.network(
                                  "${state.detailArticle.imageUrl}",
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
                              "${state.detailArticle.title}".text.bold.size(20),
                              const SizedBox(
                                height: 24,
                              ),
                              "${state.detailArticle.content}".text.size(18),
                            ],
                          ),
                        )
                      ],
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
