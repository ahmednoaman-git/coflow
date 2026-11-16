import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/app_faq_cubit.dart';
import '../cubit/app_faq_state.dart';

/// Body of the FAQ screen: a short lead-in, then the expandable questions.
class AppFaqBody extends StatelessWidget {
  const AppFaqBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppFaqCubit>();
    final accent = context.colors.signatureBlue;

    return LogoRefreshIndicator(
      onRefresh: cubit.refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.spacing.s24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                spacing: context.spacing.s24,
                children: [
                  Text(
                    context.l10n.appFaq_subtitle,
                    style: context.typography.book14.tertiary(context),
                  ),
                  AsyncHandler<AppFaqCubit, AppFaqState, List<AppFaqEntity>>(
                    requestManagerGetter: (cubit) => cubit.faqsManager,
                    skeletonBuilder: (_) => const FaqSkeleton(),
                    onRetry: (cubit) => cubit.refresh(),
                    onBackgroundError: (context, failure) =>
                        context.showErrorSnackBar(failure.message),
                    successBuilder: (context, faqs) {
                      if (faqs.isEmpty) {
                        return EmptyStateView(
                          icon: SolarIconsOutline.questionCircle,
                          title: context.l10n.appFaq_empty,
                          hint: context.l10n.appFaq_emptyHint,
                        );
                      }

                      return BlocSelector<AppFaqCubit, AppFaqState, Set<int>>(
                        selector: (state) => state.expandedIds,
                        builder: (context, expandedIds) => Column(
                          spacing: context.spacing.s12,
                          children: [
                            for (final faq in faqs)
                              FaqTile(
                                question: faq.question,
                                answer: faq.answer,
                                isExpanded: expandedIds.contains(faq.id),
                                accentColor: accent,
                                onTap: () => cubit.toggleExpanded(faq.id),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SliverBottomInset(),
        ],
      ),
    );
  }
}
