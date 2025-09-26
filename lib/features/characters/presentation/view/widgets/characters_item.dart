
import 'package:blocwithomerahmed/features/characters%20details/presentation/view/characters_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/loading.dart';
import '../../../data/models/charactes_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.charactersModel});

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: charactersModel.id,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async => Navigator.pushNamed(context, CharactersDetailsView.routeName, arguments: charactersModel,),
            child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54, // zy background shadow
              alignment: Alignment.bottomCenter,
              child: Text(
                charactersModel.name,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.ellipsis, // lw el asm tl3 twel y7ot no2t fy el a5er
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            child: Container(
              color: AppColors.grey,
              child: charactersModel.image.isNotEmpty
                ? Image.network(
            charactersModel.image,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Loading();
            },
          )
                : Image.asset('assets/images/astfham.png'),
              // child: charactersModel.image.isNotEmpty
              //     ? FadeInImage.assetNetwork(
              //         width: double.infinity,
              //         height: double.infinity,
              //         placeholder: 'assets/animation/Loading Dots In Yellow.json', m7tag png aw jpg aw gif
              //         image: charactersModel.image,
              //         fit: BoxFit.cover,
              //       )
                  // el placeholder da elly hyban l7d ma el image t7ml
                  // : Image.asset('assets/images/astfham.png'),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
