import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/features/organisation/controller/organisation_controller.dart';
import 'package:inertia/features/sidebar/sidebar.dart';
import 'package:inertia/utils/enums.dart';
import 'package:inertia/widgets/widgets.dart';

class ProjectsView extends ConsumerWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orgState = ref.watch(organisationControllerProvider);
    final selected = orgState.organisations.firstWhere((element) => element.isSelected);
    final orgController = ref.read(organisationControllerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFieldWidget(
          enabledBorder: InputBorder.none,
          validator: (_) => null,
          controller: selected.textController..text = selected.name!,
          suffixIconConstraints: const BoxConstraints(minWidth: 30, minHeight: 20),
          suffixIcon: SizedBox.square(
            dimension: 25,
            child: ValueListenableBuilder(
              valueListenable: selected.textController,
              builder: (ctx, val, _) {
                return IconButton.filledTonal(
                  padding: EdgeInsets.zero,
                  onPressed: switch ((val.text == selected.name, val.text.isEmpty)) {
                    (true, true) => null,
                    (false, true) => null,
                    (true, false) => null,
                    (false, false) => () => orgController.changeName(id: selected.id, name: val.text.trim()),
                  },
                  icon: const Icon(Icons.check),
                );
              },
            ),
          ),
          border: InputBorder.none,
        ),
        const Divider(height: 0),
        10.verticalSpace,
        Row(
          children: [
            Text(
              "PROJECTS (0)",
              style: context.theme.textTheme.bodySmall?.copyWith(
                fontSize: 11,
              ),
            ).paddingSymmetric(horizontal: 15),
            SizedBox.square(
              dimension: 17,
              child: IconButton.filledTonal(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
        CustomTextFieldWidget(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // enabledBorder: InputBorder.none,
          validator: (_) => null,
          hintText: "Filter",
          // border: InputBorder.none,
        ).paddingSymmetric(horizontal: 15, vertical: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, index) {
              return ListTile(
                contentPadding: const EdgeInsets.only(right: 8, left: 15),
                dense: true,
                onTap: () {
                  ref.read(sidebarStatusProvider.notifier).update((_) {
                    return SidebarType.collection;
                  });
                },
                leading: Text("Project $index"),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              );
            },
          ),
        )
      ],
    );
  }
}
