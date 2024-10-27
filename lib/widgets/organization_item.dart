import 'package:avatar_generator/avatar_generator.dart';
import 'package:flutter/material.dart';
import 'package:inertia/extensions/extensions.dart';
import 'package:inertia/models/models.dart';

class OrganizationItem extends StatelessWidget {
  const OrganizationItem({
    super.key,
    required this.organisation,
    required this.onTap,
  });
  final Organisation organisation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = organisation.isSelected;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: 50,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              border: switch (isSelected) {
                true => Border.all(color: context.theme.colorScheme.secondary, width: 3),
                false => null,
              },
              shape: BoxShape.circle,
            ),
            child: MaterialButton(
              onPressed: onTap,
              color: context.theme.primaryColorDark,
              padding: EdgeInsets.zero,
              elevation: 0,
              shape: const CircleBorder(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: AvatarGenerator(seed: organisation.name!),
              ),
            ).paddingAll(isSelected ? 3 : 0),
          ),
        ),
      ],
    );
  }
}
