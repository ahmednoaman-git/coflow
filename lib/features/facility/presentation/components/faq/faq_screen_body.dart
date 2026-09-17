import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../cubit/cubit.dart';
import 'faq_empty_state.dart';
import 'faq_shimmer.dart';
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

        return RefreshIndicator(
          onRefresh: cubit.refreshFaqs,
          color: accentColor,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              context.spacing.s16,
              context.spacing.s24,
              context.spacing.s16,
              context.bottomInset + context.spacing.s24,
            ),
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
                  initialBuilder: (_) => const FaqShimmer(),
                  loadingBuilder: (_) => const FaqShimmer(),
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
        );
      },
    );
  }
}
