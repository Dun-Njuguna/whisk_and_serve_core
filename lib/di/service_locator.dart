import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whisk_and_serve_core/entities/category.dart';

final sl = GetIt.instance;

// Initialize and register Isar
Future<void> registerIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      CategorySchema,
    ],
    directory: dir.path,
  );

  sl.registerSingleton<Isar>(isar);
}
