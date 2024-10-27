import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/widgets/widgets.dart';

class HomeScreenAppBar extends ConsumerWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(),
        Row(
          children: [
            CustomButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(FontAwesome.user_plus_solid, size: 12),
                  10.horizontalSpace,
                  const AutoSizeText('Invite'),
                ],
              ),
            ),
            10.horizontalSpace,
            CustomButton(
              addBorder: true,
              onPressed: () {},
              title: 'Sign in',
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
