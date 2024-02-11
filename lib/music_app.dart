import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/pages/home/home_page.dart';
import 'package:music_app/repository/base_repository.dart';
import 'package:music_app/repository/mock_repository.dart';
import 'package:music_app/state/home/home_bloc.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseRepository repository = MockRepository();

    return MaterialApp(
      home: RepositoryProvider.value(
        value: repository,
        child: BlocProvider(
          create: (context) =>
              HomeBloc(repository: repository)..add(LoadHome()),
          child: const HomePage(),
        ),
      ),
    );
  }
}
