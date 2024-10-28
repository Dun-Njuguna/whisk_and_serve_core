import 'package:isar/isar.dart';

class IsarHelpers {
  final Isar isar;

  IsarHelpers(this.isar);

  Future<List<T>> getAll<T>() async {
    return await isar.collection<T>().where().findAll();
  }

  Future<void> putAll<T>(List<T> items) async {
    await isar.writeTxn(() async {
      for (var item in items) {
        await isar.collection<T>().put(item);
      }
    });
  }

  Future<void> deleteCollection<T>() async {
    await isar.writeTxn(() async {
      await isar.collection<T>().clear();
    });
  }

  Future<void> clearExpiredRecords<T>(
    Duration expiryDuration,
  ) async {
    final expiryDate = DateTime.now().subtract(expiryDuration);

    final expiredRecords = await isar
        .collection<T>()
        .buildQuery<T>(
          filter: FilterGroup.and([
            FilterCondition.lessThan(
              property: 'createdAt',
              value: expiryDate.millisecondsSinceEpoch,
            ),
          ]),
        )
        .findAll();

    if (expiredRecords.isNotEmpty) {
      await isar.writeTxn(() async {
        await isar.collection<T>().clear();
      });
    }
  }
}
