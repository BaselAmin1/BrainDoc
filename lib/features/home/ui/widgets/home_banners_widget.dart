import 'package:BrainDoc/core/theming/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

int _currentIndex = 0;

final List<String> images = [
  Assets.assetsImagesBanner,
  Assets.assetsImagesBanner,
];

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            items: images
                .map(
                  (item) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Center(
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 1,
              aspectRatio: 2.9,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
