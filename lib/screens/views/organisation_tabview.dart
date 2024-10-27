import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/features/organisation/controller/organisation_controller.dart';
import 'package:inertia/widgets/widgets.dart';

class OrganisationTabview extends ConsumerWidget {
  const OrganisationTabview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orgController = ref.read(organisationControllerProvider.notifier);
    final orgState = ref.watch(organisationControllerProvider);
    return ListView.separated(
      itemCount: orgState.organisations.length + 1,
      padding: const EdgeInsets.only(top: 10, left: 0),
      itemBuilder: (context, index) {
        if (index == orgState.organisations.length) {
          return IconButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              orgController.add("New organisation");
            },
            icon: const Icon(Icons.add),
          );
        }
        return OrganizationItem(
          onTap: () => orgController.select(orgState.organisations[index].id),
          organisation: orgState.organisations[index],
        );
      },
      separatorBuilder: (context, index) => 12.verticalSpace,
    );
  }
}
