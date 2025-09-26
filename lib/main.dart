import 'package:blocwithomerahmed/features/characters/presentation/view/characters_view.dart';
import 'package:flutter/material.dart';

import 'core/functions/on_generate_route.dart';

void main() {
  runApp(BreakingBackApp());
}

// ignore: must_be_immutable
class BreakingBackApp extends StatelessWidget {
  BreakingBackApp({super.key});
  AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
      initialRoute: CharactersView.routeName,
    );
  }
}
