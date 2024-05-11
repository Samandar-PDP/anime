import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/viewmodel/bm_provider.dart';
import 'package:provider/provider.dart';

import '../../domain/model/anime_db.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BmProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
      ),
      body: StreamBuilder(
        stream: provider.fetchLocalAnimeList(),
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
            return _successField(snapshot.data ?? []);
          } else if(snapshot.data?.isEmpty == true) {
            return const Center(child: Text("No data."));
          } else {
            return const Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
  Widget _successField(List<AnimeDb> animeList) {

  }
}
