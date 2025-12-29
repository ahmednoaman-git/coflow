import 'package:coflow_users_v2/core/core.dart';
import 'package:coflow_users_v2/features/home/domain/domain.dart';
import 'package:flutter/material.dart';

class InstructorsSection extends StatelessWidget {
  const InstructorsSection({super.key, required this.instructors});

  final List<InstructorEntity> instructors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.l10n.instructors,
          style: context.typography.bold18.primary(context),
        ),
        // Instructors Grid (placeholder - empty for now)
        if (instructors.isEmpty)
          Container(
            height: 120,
            decoration: ShapeDecoration(
              color: context.colors.backgroundGrey,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(context.spacing.s12),
              ),
            ),
            child: Center(
              child: Text(
                'Coming soon...',
                style: context.typography.medium14.tertiary(context),
              ),
            ),
          ),
      ],
    );
  }
}
