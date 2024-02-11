import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/pages/favorites/favorites_page.dart';
import 'package:music_app/pages/home/home_page.dart';
import 'package:music_app/repository/base_repository.dart';
import 'package:music_app/repository/discogs_repository.dart';
import 'package:music_app/state/favorites/favorites_bloc.dart';
import 'package:music_app/state/home/home_bloc.dart';
import 'package:music_app/storage/favorites_storage/favorites_base_storage.dart';
import 'package:music_app/storage/favorites_storage/hive/favorites_hive_storage.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  static const _tabs = [
    HomePage(),
    FavoritesPage(),
  ];

  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final BaseRepository repository = DiscogsRepository();
    final FavoritesBaseStorage favoritesStorage = FavoritesHiveStorage();

    final currentTab = _tabs[_tabIndex];

    return Scaffold(
      body: RepositoryProvider.value(
        value: repository,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => HomeBloc(repository: repository)..add(LoadHome()),
            ),
            BlocProvider(
              create: (_) => FavoritesBloc(storage: favoritesStorage)
                ..add(LoadFavorites()),
            ),
          ],
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
