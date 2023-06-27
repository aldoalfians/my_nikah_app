import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_nikah_booking/screens/main/screens/article/article_detail_screen.dart';
import 'package:my_nikah_booking/screens/main/screens/article/logic/bloc/get_article/get_article_bloc.dart';
import 'package:my_nikah_booking/screens/main/screens/article/widgets/article_list.dart';
import 'package:my_nikah_booking/screens/main/screens/wedding_schedule/logic/bloc/detail_booking/detail_booking_bloc.dart';
import 'package:my_nikah_booking/widgets/image_placeholder.dart';
import 'package:my_nikah_booking/widgets/scaffold_background.dart';
import 'package:textless/textless.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleScreen extends StatefulWidget {
  static const String routeName = '/article';
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final GetArticleBloc getArticleBloc = GetArticleBloc();
  final DetailBookingBloc detailBookingBloc = DetailBookingBloc();

  @override
  void initState() {
    getArticleBloc.add(ArticleListStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Berita & Kegiatan"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocProvider(
                  create: (context) => getArticleBloc,
                  child: BlocBuilder<GetArticleBloc, GetArticleState>(
                    bloc: getArticleBloc,
                    builder: (context, state) {
                      if (state is GetArticleLoading) {
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

                      if (state is GetArticleCompleted) {
                        var stateData = state.getArticles.data;
                        return ListView.builder(
                          itemCount: state.getArticles.data?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: const EdgeInsets.only(bottom: 16),
                              child: InkWell(
                                onTap: () {
                                  detailBookingBloc.add(
                                    DetailBookingPressed(
                                        uuid: stateData?[index].uuid as String),
                                  );

                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return ArticleDetailScreen(
                                        uuid: stateData?[index].uuid as String,
                                      );
                                    }),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      '${stateData?[index].title}'
                                          .text
                                          .semiBold
                                          .size(16),
                                      const SizedBox(height: 4),
                                      'Baca selengkapnya...'.text.size(12),
                                      const SizedBox(height: 16),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        height: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: ImagePlaceholder(
                                          child: Hero(
                                            tag: stateData?[index].uuid
                                                as String,
                                            child: FadeInImage.memoryNetwork(
                                              placeholder: kTransparentImage,
                                              image:
                                                  '${stateData?[index].imageUrl}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
