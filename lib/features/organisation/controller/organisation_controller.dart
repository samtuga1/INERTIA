import 'package:inertia/features/organisation/state.dart';
import 'package:inertia/models/models.dart';
import 'package:inertia/repositories/organisation.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'organisation_controller.g.dart';

@Riverpod(keepAlive: true)
class OrganisationController extends _$OrganisationController {
  @override
  OrganisationState build() {
    initialize();
    return OrganisationState();
  }

  void initialize() async {
    await Future.value(0);
    List<Organisation> orgs = ref.read(orgRepoProvider).fetchBulk();
    if (orgs.isEmpty) {
      final organisation = ref.read(orgRepoProvider).create(name: "New Organisation");
      if (organisation != null) {
        orgs.add(organisation);
      }
    }
    state = state.copyWith(organisations: orgs);
  }

  void fetchBulk() async {
    await Future.value(0);
    final orgs = ref.read(orgRepoProvider).fetchBulk();
    state = state.copyWith(organisations: orgs);
  }

  void add(String name) async {
    final organisation = ref.read(orgRepoProvider).create(name: name);

    if (organisation != null) {
      fetchBulk();
    }
  }

  void select(int id) async {
    ref.read(orgRepoProvider).update(id, isSelected: true);
    fetchBulk();
  }

  void changeName({required int id, required String name}) async {
    final organisation = ref.read(orgRepoProvider).update(id, name: name)..textController.text = name;
    final organisations = state.organisations;
    final selected = organisations.indexWhere((element) => element.isSelected);
    organisations[selected] = organisation;
    state = state.copyWith(organisations: organisations);
  }
}
