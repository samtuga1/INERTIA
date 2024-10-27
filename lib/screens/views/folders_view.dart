import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/features/sidebar/sidebar.dart';
import 'package:inertia/utils/utils.dart';
import 'package:inertia/widgets/custom_text_field.dart';

class FolderView extends ConsumerWidget {
  const FolderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Row(
          children: [
            Text(
              "COLLECTIONS (0)",
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
        Row(
          children: [
            IconButton(
              onPressed: () => ref.read(sidebarStatusProvider.notifier).update((_) {
                return SidebarType.project;
              }),
              icon: const Icon(Icons.keyboard_arrow_left_rounded),
            ),
            Expanded(
              child: CustomTextFieldWidget(
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // enabledBorder: InputBorder.none,
                validator: (_) => null,
                hintText: "Filter",
                // border: InputBorder.none,
              ).paddingOnly(top: 10, bottom: 10, right: 15),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, index) {
              return ListTile(
                contentPadding: const EdgeInsets.only(right: 8, left: 15),
                dense: true,
                onTap: () {},
                leading: Text("Collection $index"),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              );
            },
          ),
        )
      ],
    );
  }
}
