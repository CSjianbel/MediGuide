import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediguide/layouts/home_screen.dart';

class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

    @override
    State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

    @override
    void initState() {
        super.initState();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

        Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
        });
    }

    @override
    void dispose() {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        super.dispose();
    }

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