import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repository/local_repository_impl.dart';
import 'package:flutter_application_1/presentation/page/home_page.dart';
import 'package:flutter_application_1/presentation/page/main_page.dart';
import 'package:flutter_application_1/presentation/viewmodel/home_vm.dart';
import 'package:flutter_application_1/presentation/viewmodel/intro_provider.dart';
import 'package:provider/provider.dart';

void main() {
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