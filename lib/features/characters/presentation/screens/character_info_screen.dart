import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_models.dart';
import 'package:rick_and_morty/features/characters/data/repository/char_repository_impl.dart';
import 'package:rick_and_morty/features/characters/domain/char_use_case/char_use_case.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/enum_funcs.dart';
import 'package:rick_and_morty/internal/constants/text_helper/text_helper.dart';
import 'package:rick_and_morty/internal/constants/theme_helper/app_colors.dart';

class CharacterInfoScreen extends StatefulWidget {
  final int id;

  const CharacterInfoScreen({
    super.key,
    required this.id,
  });

  @override
  State<CharacterInfoScreen> createState() => _CharacterInfoScreenState();
}

class _CharacterInfoScreenState extends State<CharacterInfoScreen> {
  final CharacterBloc characterBloc = CharacterBloc(
    charUseCase: CharUseCase(
      charRepository: CharRepositoryImpl(),
    ),
  );

  @override
  void initState() {
    characterBloc.add(GetCharactersById(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          BlocConsumer<CharacterBloc, CharacterState>(
            bloc: characterBloc,
            listener: (context, state) {
              if (state is CharacterErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error.message.toString()),
                  ),
                );
              }

              if (state is CharacterLoadingState) {
                Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            builder: (context, state) {
              if (state is CharacterLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CharacterLoadedInfoState) {
                return Column(
                  children: [
                    SizedBox(
                      height: 218,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  state.characterResult.image ?? '',
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 8.0, sigmaY: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 61,
                              left: 16,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 138,
                            left: MediaQuery.of(context).size.width / 2 - 73,
                            child: Container(
                              width: 146,
                              height: 146,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.characterResult.image ?? '',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(73),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    Text(
                      state.characterResult.name ?? '',
                      style: TextHelper.mainCharInfo,
                    ),
                    SizedBox(height: 5),
                    Text(
                      statusConverter(
                              state.characterResult.status ?? Status.ALIVE) ??
                          '',
                      style: TextStyle(
                          color: state.characterResult.status == Status.ALIVE
                              ? AppColors.mainGreen
                              : AppColors.mainRed),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
