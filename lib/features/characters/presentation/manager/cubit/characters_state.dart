part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {} // bywrs lkol el states

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List <CharactersModel> characters;

  CharactersLoaded({required this.characters});
}
