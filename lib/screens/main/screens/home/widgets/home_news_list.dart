import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_nikah_booking/widgets/image_placeholder.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:textless/textless.dart';

class HomeNewsList extends StatelessWidget {
  const HomeNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Berita & Kegiatan'.text.size(18).bold,
            TextButton(
              onPressed: () {},
              child: 'Lainnya'
                  .text
                  .size(14)
                  .color(
                    const Color.fromARGB(216, 9, 152, 219),
                  )
                  .semiBold,
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < 3; i++)
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  'Cegah Kawin Anak, Kemenag Banyuwangi Gagas KUA Goes to School'
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ImagePlaceholder(
                      child: Hero(
                        tag: i,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: 'http://placekitten.com/g/300/220',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
