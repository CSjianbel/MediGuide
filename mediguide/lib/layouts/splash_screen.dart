import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediguide/layouts/chat_screen.dart';
import 'package:mediguide/utils/theme_utils.dart';

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
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const ChatScreen()));
        });
    }

    @override
    void dispose() {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        final ThemeData currentTheme = ThemeUtils.getTheme(context);

        return Material(
            color: currentTheme.scaffoldBackgroundColor,
            child: Center(child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset("assets/images/Logo.png", width: 100, height: 100, fit: BoxFit.fitWidth),
                    const SizedBox(height: 15),
                    Text("MediGuide",
                        style: TextStyle(
                            fontFamily: 'CarterOne',
                            color: ThemeUtils.foreground(currentTheme),
                            fontSize: 24
                        )
                    )
                ]
            )
          )
        );
    }
}