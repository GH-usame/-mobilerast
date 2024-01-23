import 'package:flutter/material.dart';
import 'package:rast_mobile/screens/homeScreen.dart';

import '../model/model.dart';
import '../model/service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool serverIsRunning = false;

  @override
  void initState() {
    super.initState();
    // Splash screen için bir bekleme süresi ekleyebilirsiniz.
    Future.delayed(const Duration(seconds: 1), () async {
      await checkServerStatusAndNavigate();
    });
  }

  Future<void> checkServerStatusAndNavigate() async {
    if (await MyService().checkServerStatus()) {
      serverIsRunning = true;
      await getItemList();
      Navigator.of(context).pushReplacementNamed(HomeScreen.rout);
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Warning",
              style: TextStyle(color: Theme.of(context).primaryColor)),
          content:
              const Text("The server is not running, Please run the server"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Restart the app by popping all routes and pushing SplashScreen again
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (route) => false,
                );
              },
              child: const Text("Try again"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/splash2.png",
      fit: BoxFit.cover,
    );
  }
}
