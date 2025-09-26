
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({super.key, required this.title, required this.value, required this.endIndent});

  
    final String title, value;
    final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: value,
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.yellow,
          height: 35,
          endIndent: endIndent, // el 3rd bta3o
        ),
      ],
    );
  }
}