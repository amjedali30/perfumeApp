import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../model/homeModel.dart';

class BannerSection extends StatelessWidget {
  BannerSection({super.key, required this.items});

  List<CarouselItem> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items
          .map((item) => Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        "https://www.shutterstock.com/image-vector/ad-banner-template-kids-clothes-260nw-2178163595.jpg",
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
      ),
    );
  }
}
