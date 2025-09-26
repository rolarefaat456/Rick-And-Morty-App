import 'package:bloc/bloc.dart';
import 'package:blocwithomerahmed/features/characters/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/charactes_model.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<CharactersModel> ?characters;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Future <List<CharactersModel>> getAllCharacters() async {
    final mycharacters = await charactersRepository
        .getAllCharacters();
        // print("عدد الشخصيات الراجعة من الـ repo: ${mycharacters.length}");
// mycharacters.take(5).forEach((c) => print(c.name));
        characters = mycharacters;
        emit(CharactersLoaded(characters: mycharacters));
        return mycharacters; // bta3t elly fy el class msh el function
  }
}
