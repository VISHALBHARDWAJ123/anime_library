import 'package:anime_library/screen/home_screen/widget/upcoming_animes_widget/upcoming_anime_season_widget.dart';
import 'package:anime_library/utils/app_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  final controller = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: _key,
        appBar: const SizedBox(),
        slider: const CustomNavigationDrawer(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: Adaptive.h(7),
              pinned: true,
              floating: false,
              leading: InkWell(
                onTap: () => _key.currentState!.isDrawerOpen ? _key.currentState!.closeSlider() : _key.currentState!.openSlider(),
                child: Image.asset(
                  'assets/mylogo.png',
                  height: Adaptive.h(7),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TopAnimeSlider(
                controller: controller,
              ),
            ),
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 9 / 19,
                child: UpComingSeasonsWidget(
                  controller: controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
