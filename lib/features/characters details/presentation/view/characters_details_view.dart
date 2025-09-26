import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blocwithomerahmed/core/utils/app_colors.dart';
import 'package:blocwithomerahmed/features/characters/data/models/charactes_model.dart';
import 'package:blocwithomerahmed/features/characters/presentation/manager/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading.dart';
import 'widgets/character_info.dart';

class CharactersDetailsView extends StatefulWidget {
  const CharactersDetailsView({super.key, required this.character});
  final CharactersModel character;
  static const String routeName = 'characters-details';

  @override
  State<CharactersDetailsView> createState() => _CharactersDetailsViewState();
}

class _CharactersDetailsViewState extends State<CharactersDetailsView> {

  
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    // keda ndht 3la el cubit wa sh8lto l2no byt3mlo create bykon lazy msh sh8al
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600, // tol el image
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true, // el title fykon fy el nos
        title: Text(
          widget.character.name,
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        background: Hero(
          tag: widget.character.id,
          child: Image.network(widget.character.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterInfo(
                      title: 'species : ',
                      value: widget.character.species,
                      endIndent: 250,
                    ),
                    CharacterInfo(
                      endIndent: 300,
                      title: 'created : ',
                      value: widget.character.created,
                    ),
                    CharacterInfo(
                      endIndent: 200,
                      title: 'episode : ',
                      value: widget.character.episode.join(
                        ' / ',
                      ), // keda el list of string htt7ol l string mfsol byn kol item w elly b3do by /
                    ),
                    CharacterInfo(
                      title: 'gender : ',
                      value: widget.character.gender,
                      endIndent: 300,
                    ),
                    CharacterInfo(
                      endIndent: 200,
                      title: 'statusDeadOrAlife : ',
                      value: widget.character.statusDeadOrAlife,
                    ),
                    widget.character.location != null
                        ? CharacterInfo(
                            endIndent: 250,
                            title: 'location : ',
                            value: widget.character.location!.name.toString(),
                          )
                        : SizedBox.shrink(),
                    widget.character.origin != null
                        ? CharacterInfo(
                            endIndent: 250,
                            title: 'origin : ',
                            value: widget.character.origin!.name.toString(),
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 16),
                    BlocBuilder<CharactersCubit, CharactersState>(
                      builder: (context, state) {
                        return AnimatedTextWidget(state: state);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }
}

class AnimatedTextWidget extends StatelessWidget {
  AnimatedTextWidget({super.key, required this.state});
  final CharactersState state;
  final List<String> qoutes = [
    'dsssssssssssss',
    'cddddddddddddd',
    'faaaaaaaaaa',
    'aggggggggggg',
    'ssddddddddddd',
    'gwqwwwwwwwwww',
    'hqqqqqqqqqqq',
    'jhhhhhhhhhhhhhh',
  ]; // lw 3ndy gay mn el api h3mlo cubit w hktb hyna (state).asm_elly_ana_farda_ll_list

  @override
  Widget build(BuildContext context) {
    if (state is CharactersLoaded) {
      if (qoutes.isNotEmpty) {
        int randomQoutesIndex =
            Random // m7taga import 'dart:math'
                ()
                .nextInt(
                  qoutes.length -
                      1, // 3lshan bttl3 rkm 3shwa2y mn el 3dd elly ana 7ata hyna w bybd2 mn el zero f lazm 3lshan mya5dsh rkm bra el list
                );
        return Center(
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.yellow,
              fontSize: 20,
              shadows: [
                Shadow(
                  color: AppColors.yellow,

                  blurRadius: 7, //  el entshar
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: AnimatedTextKit(
              repeatForever: true, // httkerr ll 2bd
              animatedTexts: [
                FlickerAnimatedText // el text elly hayzhar
                (
                  qoutes[randomQoutesIndex // el index elly bygyly 3shwa2y elly ana 3mlto fo2
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return Container(); // kedad msh by3rd 7aga
      }
    } else {
      return Center(child: Loading());
    }
  }
}
