import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/presentation/page/detail_page.dart';
import 'package:flutter_application_1/presentation/viewmodel/home_vm.dart';
import 'package:flutter_application_1/presentation/widget/anime_item.dart';
import 'package:flutter_application_1/presentation/widget/anime_top_item.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../widget/main_shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel _provider;

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).fetchAnimeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<HomeViewModel>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Anime"),
        ),
        body: _provider.animeList.isNotEmpty
            ? _successField()
            : const MainShimmer()
    );
  }

  _successField() {
    return ListView(
      children: [
        Expanded(
          child: CarouselSlider.builder(
            itemCount: _provider.animeList.length,
            itemBuilder: (context, index, v) => OpenContainer(
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                closedElevation: 0,
                openBuilder: (context, callback) => DetailPage(anime: _provider.animeList[index],),
                closedBuilder: (context, callback) => AnimeTopItem(
                    anime: _provider.animeList[index], onClick: callback)),
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              aspectRatio: 1.2,
            ),
          ),
        ),
        const Gap(20),
        const Text(
          "\t\tTrending now",
          style: TextStyle(fontSize: 17),
        ),
        const Gap(10),
        SizedBox(
          height: 160,
          child: _provider.animeList2.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _provider.animeList2.length,
            itemBuilder: (context, index) => OpenContainer(
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                closedElevation: 0,
                closedBuilder: (context, callback) => AnimeItem(
                    anime: _provider.animeList2[index],
                    onClick: callback),
                openBuilder: (ctx, cls) => DetailPage(anime: _provider.animeList2[index],)),
          )
              : Container(),
        ),
        const Gap(10),
        const Text(
          "\t\tNew Episodes",
          style: TextStyle(fontSize: 17),
        ),
        const Gap(10),
        SizedBox(
          height: 160,
          child: _provider.animeList3.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _provider.animeList3.length,
                  itemBuilder: (context, index) => OpenContainer(
                      closedColor: Colors.transparent,
                      openColor: Colors.transparent,
                      closedElevation: 0,
                      closedBuilder: (context, callback) => AnimeItem(
                          anime: _provider.animeList3[index],
                          onClick: callback),
                      openBuilder: (ctx, cls) => DetailPage(anime: _provider.animeList3[index],)),
                )
              : Container(),
        ),
        const Gap(100)
      ],
    );
  }
}
