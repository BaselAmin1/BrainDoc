import 'package:BrainDoc/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

int _currentIndex = 0;

final List<String> images = [];

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetBannersSuccess) {
          images.clear();
          for (var image in state.banners) {
            images.add(image['image']);
          }
        }
      },
      builder: (context, state) {
        return images.isNotEmpty
            ? Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      items: images
                          .map(
                            (item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Center(
                                  child: CachedNetworkImage(
                                imageUrl: item,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              )),
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
              )
            : const SizedBox();
      },
    );
  }
}
