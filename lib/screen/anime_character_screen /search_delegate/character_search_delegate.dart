import 'package:anime_library/utils/app_export.dart';
import 'package:anime_library/utils/models/character_details_model.dart';
import 'package:anime_library/utils/models/character_list_model.dart';

class CharacterSearchDelegate extends SearchDelegate<String> {
  final controller = AnimeCharactersListController();
  List<String> characterNames = [...popularAnimeCharacters];

  CharacterSearchDelegate();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          controller.searchedList.clear();
          controller.searchLoading = false;
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Observer(
      builder: (context) {
        return controller.searchLoading
            ? Center(
                child: loadingBar(),
              )
            : controller.searchedList.isEmpty
                ? const Center(
                    child: Text(
                      'Search other characters.....',
                    ),
                  )
                : GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(2, 2),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) => InkWell(
                        onTap: () {
                          goToScreen(
                            routeName: animeCharacterDetailsPageRoute,
                            context: context,
                            data: '?image=${controller.searchedList[index].images!.jpg!.imageUrl}&characterId=${controller.searchedList[index].malId}',
                          );
                        },
                        child: AnimeCharacterItemWidget(
                          itemModel: controller.searchedList[index],
                        ),
                      ),
                      childCount: controller.searchedList.length,
                    ),
                  );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = popularAnimeCharacters.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    if (suggestions.isEmpty) {
      suggestions = [query];
    }
    return Wrap(
      children: List.generate(
          suggestions.length,
          (index) => SuggestionItem(
              onSelected: (value) {
                value ? query = suggestions.elementAt(index) : query == '';
                query.isNotEmpty ? controller.getSearchedCharacters(query: query) : null;
              },
              label: suggestions.elementAt(index))),
    );
  }
}

class SuggestionItem extends StatefulWidget {
  const SuggestionItem({super.key, required this.onSelected, required this.label});

  final ValueChanged<bool> onSelected;
  final String label;

  @override
  State<SuggestionItem> createState() => _SuggestionItemState();
}

class _SuggestionItemState extends State<SuggestionItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        label: Text(
          widget.label,
          style: TextStyle(fontSize: 8.sp),
        ),
        selected: selected,
        onSelected: (value) {
          widget.onSelected(value);
          selected = value;
          setState(() {});
        },
      ),
    );
  }
}
