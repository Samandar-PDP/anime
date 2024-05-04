import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class MainShimmer extends StatelessWidget {
  const MainShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Expanded(
          child: CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, v) => _shimmerCard(context),
            options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              aspectRatio: 1.2,
            ),
          ),
        ),
        const Gap(20),
        Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.primary,
            highlightColor: Colors.white60,
            child: Container(
              width: 150,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey
              ),
            )),
        const Gap(20),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemBuilder: (context, index) => _shimmerCard(context),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }

  _shimmerCard(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white60,
      baseColor: Theme.of(context).colorScheme.primary,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
