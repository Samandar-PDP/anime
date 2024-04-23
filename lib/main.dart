import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/page/home_page.dart';
import 'package:flutter_application_1/presentation/page/intro_page.dart';
import 'package:flutter_application_1/presentation/viewmodel/home_vm.dart';
import 'package:flutter_application_1/presentation/viewmodel/intro_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<IntroProvider>(context).introState;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => IntroProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey,brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: state == true ? HomePage() : IntroPage(),
      ),
    );
  }
}