import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/music_app.dart';
import 'package:music_app/storage/favorites_storage/hive/favorites_hive_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  FavoritesHiveStorage.registerAdapters();

  runApp(const MaterialApp(home: MusicApp()));
}
