import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/model/anime.dart';
import 'package:flutter_application_1/presentation/viewmodel/detail_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.anime});

  final Anime anime;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  late DetailProvider _provider;

  @override
  void initState() {
  //  Provider.of<DetailProvider>(context, listen: false).init();
    Provider.of<DetailProvider>(context, listen: false).checkSavedOrNot(widget.anime.malId ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<DetailProvider>(context,listen: true);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              IconButton(onPressed: () => _provider.saveOrDelete(widget.anime), icon: Icon(
                  _provider.isSaved ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark
              ),
                color: _provider.isSaved ? Colors.white : Colors.white38,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.all(16),
                title: Text(widget.anime.name ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ) //TextStyle
                ), //Text
                background: Image.network(
                  widget.anime.image ?? "",
                  fit: BoxFit.fill,
                ),
            ),
              expandedHeight: 260,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Back',
                onPressed: () => Navigator.of(context).pop(),
              )//
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(widget.anime.nameKanji ?? "",style: const TextStyle(
                    fontSize: 20
                  ),),
                  const Gap(20),
                  for(int i = 0; i < (widget.anime.nicknames?.length ?? 0); i++)
                    Text(widget.anime.nicknames?[i] ?? ""),
                  const Gap(20),
                  Text(widget.anime.about ?? "")
                ],
              ),
            ),
          )
        ],
      ),
    );
    // return Scaffold(
    //     extendBodyBehindAppBar: true,
    //     appBar: AppBar(
    //       elevation: 0,
    //       backgroundColor: Colors.transparent,
    //     ),
    //     body: Column(
    //       children: [
    //         SizedBox(
    //           height: 250,
    //           child: Image.network(widget.anime.image ?? "",
    //               fit: BoxFit.fill,
    //               width: MediaQuery.of(context).size.width),
    //         ),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
    //             child: ListView(
    //               children: [
    //                 Text("${widget.anime.name}\n${widget.anime.nameKanji}",
    //                     style: const TextStyle(fontSize: 20)),
    //                 const Gap(20),
    //                 Text(widget.anime.about ?? "")
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ));
  }
}
