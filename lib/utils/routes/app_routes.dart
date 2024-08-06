import 'package:mobx_examle/screen/character_details_screen/anime_character_details_screen.dart';
import 'package:mobx_examle/screen/splash_screen/splash_screen.dart';
import 'package:mobx_examle/utils/app_export.dart';

class AppRoutes {
  AppRoutes._();

  static final homeRoute = GoRoute(
    path: homePageRoute,
    builder: (context, state) => const HomeScreen(),
  );
  static final splashRoute = GoRoute(
    path: splashPageRoute,
    builder: (context, state) => const SplashScreen(),
  );
  static final newsRoute = GoRoute(
    path: newsPageRoute,
    builder: (context, state) => const NewsScreen(),
  );
  static final animeCharactersRoute = GoRoute(
    path: animeCharactersPageRoute,
    builder: (context, state) => const AnimeCharactersScreen(),
  );
  static final upcomingSeasonsRoute = GoRoute(
    path: upcomingSeasonsPageRoute,
    builder: (context, state) => const UpcomingSeasonScreen(),
  );
  static final characterDetailsRoute = GoRoute(
    path: animeCharacterDetailsPageRoute,
    builder: (context, state) {
      final image = state.uri.queryParameters['image']!;
      final int characterId = int.parse(state.uri.queryParameters['characterId']!);
      return CharacterDetailsScreens(
        image: image,
        characterId: characterId,
      );
    },
  );
}
