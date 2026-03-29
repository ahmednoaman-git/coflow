import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../../facility/domain/entities/entities.dart';
import '../../../page_section.dart';

/// Branches section for facility profile.
class BranchesSection extends StatelessWidget {
  const BranchesSection({super.key, required this.branches});

  final List<BranchEntity> branches;

  @override
  Widget build(BuildContext context) {
    if (branches.isEmpty) {
      return const SizedBox.shrink();
    }

    return PageSection(
      title: context.l10n.facilityDetails_branchesSectionTitle,
      svgIconPath: Assets.svgs.branch.path,
      children: [
        SizedBox(
          height: _BranchCard.height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: branches.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => SizedBox(width: context.spacing.s16),
            itemBuilder: (context, index) {
              final branch = branches[index];
              return _BranchCard(branch: branch);
            },
          ),
        ),
      ],
    );
  }
}

class _BranchCard extends StatelessWidget {
  const _BranchCard({required this.branch});

  final BranchEntity branch;

  static const double width = 110;
  static const double height = 165;

  @override
  Widget build(BuildContext context) {
    final overlayBaseColor = context.colors.textPrimary;
    final branchTitle = branch.title.trim();

    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(context.spacing.s16),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: ShimmerImage(
                imageUrl: branch.coverUrl,
                borderRadius: context.spacing.s16,
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      overlayBaseColor.withValues(alpha: 0),
                      overlayBaseColor.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ),
            if (branchTitle.isNotEmpty)
              Positioned(
                bottom: context.spacing.s8,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(context.spacing.s8),
                  child: Row(
                    mainAxisAlignment: .center,
                    spacing: context.spacing.s4,
                    children: [
                      Assets.svgs.location.svg(
                        width: 15,
                        height: 15,
                        colorFilter: context.colors.textWhite.colorFilter,
                      ),
                      Flexible(
                        child: Text(
                          branchTitle,
                          style: context.typography.medium12.inverse(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
