import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/main.dart';
import 'package:inertia/models/models.dart';
import 'package:isar/isar.dart';

final orgRepoProvider = Provider((_) => OrganisationRepo());

class OrganisationRepo {
  Organisation? create({required String name}) {
    final organisation = Organisation()..name = name;
    final id = isar.writeTxnSync<int>(() {
      deSelected();

      return oranisationCol.putSync(organisation);
    });

    return oranisationCol.getSync(id);
  }

  List<Organisation> fetchBulk() {
    List<Organisation> organisations = [];
    isar.writeTxnSync(() {
      organisations = isar.organisations.where().findAllSync();
    });

    return organisations;
  }

  Organisation? fetchSingle(int id) {
    return isar.writeTxnSync(() => oranisationCol.getSync(id));
  }

  Organisation update(int id, {String? name, bool? isSelected}) {
    late Organisation updated;
    isar.writeTxnSync(() {
      final org = isar.organisations.getSync(id)!;

      if (name != null) {
        org.name = name;
      }

      if (isSelected != null) {
        org.isSelected = isSelected;
        deSelected();
      }

      final orgId = oranisationCol.putSync(org);

      updated = isar.organisations.getSync(orgId)!;
    });
    return updated;
  }

  void deSelected() {
    final alreadySelectedOrg = oranisationCol.where().filter().isSelectedEqualTo(true).findFirstSync();

    if (alreadySelectedOrg != null) {
      alreadySelectedOrg.isSelected = false;
      oranisationCol.putSync(alreadySelectedOrg);
    }
  }
}
