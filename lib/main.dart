import 'utils/app_export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) {
    return const PageNotFoundScreen();
  },
  routes: [
    AppRoutes.splashRoute,
    AppRoutes.homeRoute,
    AppRoutes.animeListScreenRoute,
    AppRoutes.newsRoute,
    AppRoutes.animeCharactersRoute,
    AppRoutes.upcomingSeasonsRoute,
    AppRoutes.characterDetailsRoute,
    AppRoutes.animeDetailsRoute,
    AppRoutes.browserRoute,
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, ori, screenTye) {
      return MaterialApp.router(
        key: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.prompt().fontFamily,
        ),
        routerConfig: _router,
      );
    });
  }
}
