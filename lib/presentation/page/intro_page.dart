import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/img/img.png',fit: BoxFit.cover,
              width: double.infinity, height: double.infinity,opacity: const AlwaysStoppedAnimation(.7)),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("zeto", style: TextStyle(color: Colors.white,fontSize: 35)),
                  const Gap(25),
                  const Text("Embark on animated journey like\nnever before,"
                      "your gateway to the\nultimate anime experience!",textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white
                  ),),
                  const Gap(25),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(onPressed: _onStart, style:
                      ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ), child: const Text("Watch Anime")),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void _onStart() {

  }
}
