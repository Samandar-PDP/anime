import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/local/anime_database.dart';
import 'package:flutter_application_1/data/repository/local_repository_impl.dart';
import 'package:flutter_application_1/presentation/page/home_page.dart';
import 'package:flutter_application_1/presentation/page/main_page.dart';
import 'package:flutter_application_1/presentation/viewmodel/bm_provider.dart';
import 'package:flutter_application_1/presentation/viewmodel/detail_provider.dart';
import 'package:flutter_application_1/presentation/viewmodel/home_vm.dart';
import 'package:flutter_application_1/presentation/viewmodel/intro_provider.dart';
import 'package:flutter_application_1/util/initializer.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await $FloorAnimeDatabase.databaseBuilder("anime.db").build();
  Initializer.dao = db.animeDao;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _repo = LocalRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => IntroProvider()),
        ChangeNotifierProvider(create: (context) => DetailProvider()),
        ChangeNotifierProvider(create: (context) => BmProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green,brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: _repo.isFirstTime(),
          builder: (context, data) {
            return data.data == true ? const HomePage() : const MainPage();
          },
        ),
      ),
    );
  }
}