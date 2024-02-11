import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/pages/home/home_page.dart';
import 'package:music_app/repository/base_repository.dart';
import 'package:music_app/repository/mock_repository.dart';
import 'package:music_app/state/home/home_bloc.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  static const _tabs = [
    HomePage(),
    Placeholder(),
  ];

  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final BaseRepository repository = MockRepository();
    final currentTab = _tabs[_tabIndex];

    return Scaffold(
      body: RepositoryProvider.value(
        value: repository,
        child: BlocProvider(
          create: (context) =>
              HomeBloc(repository: repository)..add(LoadHome()),
          child: currentTab,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setCurrentTab,
        currentIndex: _tabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _setCurrentTab(int index) => setState(() => _tabIndex = index);
}
