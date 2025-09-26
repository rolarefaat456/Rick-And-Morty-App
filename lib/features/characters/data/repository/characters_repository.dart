import '../models/charactes_model.dart';
import '../web/characters_api.dart';

class CharactersRepository {
  CharactersApi charactersApi = CharactersApi();

  Future<List<CharactersModel>> getAllCharacters() async {
    final characters = await charactersApi.getAllCharacters();
    return characters
        .map // dy bt3ml lop 3la el map model bt3ty w b3dha bt7ol ly list
        ((character) => CharactersModel.fromJson(character))
        .toList();
  }
}




