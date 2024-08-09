import 'package:anime_library/utils/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => context.go(animeListPageRoute),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/mylogo.png', // Replace with your logo asset
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            loadingBar(),
          ],
        ),
      ),
    );
  }
}
