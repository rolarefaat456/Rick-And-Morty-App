import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/characters%20details/presentation/view/characters_details_view.dart';
import '../../features/characters/data/models/charactes_model.dart';
import '../../features/characters/data/repository/characters_repository.dart';
import '../../features/characters/presentation/manager/cubit/characters_cubit.dart';
import '../../features/characters/presentation/view/characters_view.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository();
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case CharactersView.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            // by3ml create ll cubit
            create: (context) => CharactersCubit(charactersRepository),
            child: CharactersView(),
          ),
        );
      case CharactersDetailsView.routeName:
        final character = setting.arguments as CharactersModel;
        return MaterialPageRoute(
          builder: (_) => CharactersDetailsView(character: character),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text("No Routes Found"))),
        );
    }
  }
}
