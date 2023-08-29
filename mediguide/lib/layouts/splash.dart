import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color(0xFF171F2A),
        child: Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Logo.png", width: 100, height: 100, fit: BoxFit.fitWidth),
              const SizedBox(height: 15),
              const Text("MediGuide", style: TextStyle(color: Color(0xFF9FB4C8), fontSize: 30))
            ]
        )
      )
    );
  }
}
