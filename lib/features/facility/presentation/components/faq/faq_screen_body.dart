import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../cubit/cubit.dart';
import 'faq_empty_state.dart';
import 'faq_skeleton.dart';
import 'faq_tile.dart';

/// Body of the FAQ screen: a short lead-in, then the questions.
class FaqScreenBody extends StatelessWidget {
  const FaqScreenBody({
    super.key,
    required this.facilityName,
    required this.accentColor,
  });

  final String facilityName;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilityFaqCubit, FacilityFaqState>(
      builder: (context, state) {
        final cubit = context.read<FacilityFaqCubit>();

        return LogoRefreshIndicator(
          onRefresh: cubit.refreshFaqs,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  context.spacing.s16,
                  context.spacing.s24,
                  context.spacing.s16,
                  context.spacing.s24,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: context.spacing.s24,
                    children: [
                      Text(
                        context.l10n.facilityFaq_subtitle(facilityName),
                        style: context.typography.book13.tertiary(context),
                      ),
                      AsyncHandler<FacilityFaqCubit, FacilityFaqState, List<FacilityFaqEntity>>(
                        requestManagerGetter: (cubit) => cubit.faqsManager,
                        skeletonBuilder: (_) => const FaqSkeleton(),
                        successBuilder: (context, faqs) {
                          if (faqs.isEmpty) return FaqEmptyState(accentColor: accentColor);

                          return Column(
                            spacing: context.spacing.s12,
                            children: [
                              for (final faq in faqs)
                                FaqTile(
                                  faq: faq,
                                  isExpanded: state.expandedIds.contains(faq.id),
                                  accentColor: accentColor,
                                  onTap: () => cubit.toggleExpanded(faq.id),
                                ),
                            ],
                          );
                        },
                        onRetry: (cubit) => cubit.refreshFaqs(),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverBottomInset(),
            ],
          ),
        );
      },
    );
  }
}
