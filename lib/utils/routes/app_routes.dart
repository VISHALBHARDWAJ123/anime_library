import 'package:anime_library/screen/anime_details_screen/anime_details_screen.dart';
import 'package:anime_library/utils/app_export.dart';

class AppRoutes {
  AppRoutes._();

  static final animeListScreenRoute = GoRoute(
    path: animeListPageRoute,
    builder: (
      context,
      state,
    ) =>
        const AmineListScreen(),
  );
  static final splashRoute = GoRoute(
    path: splashPageRoute,
    builder: (
      context,
      state,
    ) =>
        const SplashScreen(),
  );
  static final newsRoute = GoRoute(
    path: newsPageRoute,
    builder: (
      context,
      state,
    ) =>
        const NewsScreen(),
  );
  static final animeCharactersRoute = GoRoute(
    path: animeCharactersPageRoute,
    builder: (
      context,
      state,
    ) =>
        const AnimeCharactersScreen(),
  );
  static final upcomingSeasonsRoute = GoRoute(
    path: upcomingSeasonsPageRoute,
    builder: (
      context,
      state,
    ) =>
        const UpcomingSeasonScreen(),
  );
  static final characterDetailsRoute = GoRoute(
    path: animeCharacterDetailsPageRoute,
    builder: (
      context,
      state,
    ) {
      final image = state.uri.queryParameters['image']!;
      final int characterId = int.parse(state.uri.queryParameters['characterId']!);
      return CharacterDetailsScreens(
        image: image,
        characterId: characterId,
      );
    },
  );
  static final homeRoute = GoRoute(
    path: settingPageRoute,
    builder: (context, state) {
      return const AmineListScreen();
    },
  );
  static final animeDetailsRoute = GoRoute(
    path: animeDetailsPageRoute,
    builder: (context, state) {
      final image = state.uri.queryParameters['image']!;
      final int animeId = int.parse(state.uri.queryParameters['animeId']!);
      return AnimeDetailsScreen(image: image, animeId: animeId);
    },
  );
}
