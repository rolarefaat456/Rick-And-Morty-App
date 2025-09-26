import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/loading.dart';
import '../../data/models/charactes_model.dart';
import '../manager/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/characters_item.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});
  static const String routeName = 'characters';

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  List<CharactersModel> searchForCharcters = [];
  List<CharactersModel> allcharacters = [];

  bool isSearching = false;

  TextEditingController searchControl = TextEditingController();

  Widget _buildSearchFeild() {
    return TextField(
      controller: searchControl,
      cursorColor: AppColors.white, // el 3lama by=ta3t mkan el keyboard
      decoration: InputDecoration(
        hintText: 'find a character',
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.white, fontSize: 18),
      ),
      style: TextStyle(color: AppColors.grey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearcheedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearcheedList(String searchedCharacter) {
    searchForCharcters = allcharacters
        .where(
          (character) =>
              character.name.toLowerCase().startsWith(searchedCharacter),
        )
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: AppColors.white),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: AppColors.white),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute // keda lma b3ml clack 3la el search button by3ml iconbutton ll back auto 3lshan hwa byftrd an fy route gdyd
        .of(context)!
        .addLocalHistoryEntry(
          LocalHistoryEntry(
            onRemove: // fy 7alt an ana tl3t mn el search
                _stopSearching,
          ),
        );
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() => searchControl.clear());
  }

  Widget _buildAppBarTitle() {
    return Text('Charactes', style: TextStyle(color: AppColors.white));
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    // keda ndht 3la el cubit wa sh8lto l2no byt3mlo create bykon lazy msh sh8al
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        title: isSearching ? _buildSearchFeild() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: isSearching ? BackButton(color: AppColors.white) : null,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          final bool connected = !connectivity.contains(ConnectivityResult.none);
          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: Center(
          child: Loading(),
        ),
      ),
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              "can\\'t connect Please check your internet",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: AppColors.grey),
            ),
            SvgPicture.asset('assets/images/undraw_no-signal_nqfa.svg',)
          ],
        ),
      ),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allcharacters = state.characters;
          if (allcharacters.isNotEmpty) {
            return buildLoadedListWidgets();
          }
          else{
            return Center(child: buildNoInternetWidget());
          }
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.yellow),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.white,
        child: Column(children: [buildCharactersList()]),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      // physics: const ClampingScrollPhysics(), // lma awsl ll a5r msh hay7sl scroll
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemCount: searchControl.text.isEmpty
          ? allcharacters.length
          : searchForCharcters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          charactersModel: searchControl.text.isEmpty
              ? allcharacters[index]
              : searchForCharcters[index],
        );
      },
    );
  }
}
