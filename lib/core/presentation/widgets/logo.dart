import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: context.spacing.s8,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: context.colors.signatureBlue,
          ),
          child: Icon(
            LucideIcons.busFront,
            color: context.colors.textWhite,
            size: 30,
          ),
        ),
        Text('ezBus Admin', style: context.typography.medium18),
      ],
    );
  }
}
