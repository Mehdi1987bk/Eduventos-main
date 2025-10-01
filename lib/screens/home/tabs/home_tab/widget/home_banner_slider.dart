import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/network/response/banners.dart';
import '../../../../../presentation/resourses/app_colors.dart';

class HomeBannerSlider extends StatefulWidget {
  final List<Banners> images;

  const HomeBannerSlider({super.key, required this.images});

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: widget.images
              .map(
                (item) => GestureDetector(
                  onTap: () {
                    if (item.link != null) {
                      return _openLink(item.link!, item.id);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: _current == widget.images.length - 1 ? 20 : 20,
                        right: (_current == widget.images.length - 1) ? 20 : 20),
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(item.image , fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              padEnds: false,
              autoPlay: true,
              enableInfiniteScroll: false,
              height: 200,
              onPageChanged: (index, reason) {
                print(index);
                setState(() {
                  _current = index;
                });
              }),
          carouselController: _controller,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 30.0 : 17.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.appColor.withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  _openLink(String link, int id) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
