import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import '../cubit/app_info_cubit.dart';
import '../cubit/app_info_state.dart';
import '../legal_document_screen.dart';

/// The chosen legal text on a white card, one paragraph per line of the text.
class LegalDocumentBody extends StatelessWidget {
  const LegalDocumentBody({super.key, required this.document});

  final LegalDocument document;

  @override
  Widget build(BuildContext context) {
    return LogoRefreshIndicator(
      onRefresh: context.read<AppInfoCubit>().refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(context.spacing.s24),
            sliver: SliverToBoxAdapter(
              child: AsyncHandler<AppInfoCubit, AppInfoState, AppInfoEntity>(
                requestManagerGetter: (cubit) => cubit.infoManager,
                skeletonBuilder: (_) => const _DocumentSkeleton(),
                onRetry: (cubit) => cubit.refresh(),
                onBackgroundError: (context, failure) => context.showErrorSnackBar(failure.message),
                successBuilder: (context, info) {
                  final text = switch (document) {
                    LegalDocument.terms => info.terms,
                    LegalDocument.privacyPolicy => info.privacyPolicy,
                  };
                  if (text == null) {
                    return EmptyStateView(
                      icon: SolarIconsOutline.documentText,
                      title: context.l10n.legal_empty,
                    );
                  }
                  return _DocumentCard(child: LegalText(text: text));
                },
              ),
            ),
          ),
          const SliverBottomInset(),
        ],
      ),
    );
  }
}

/// Lays out a plain-text legal document: each line is a paragraph, and lines
/// starting with a bullet (`•`, `-`, `*`) become indented list items.
class LegalText extends StatelessWidget {
  const LegalText({super.key, required this.text});

  final String text;

  static final RegExp _bullet = RegExp(r'^[•\-*]\s*');

  @override
  Widget build(BuildContext context) {
    final style = context.typography.book14.secondary(context).copyWith(height: 1.6);
    final paragraphs = text
        .split(RegExp(r'\r?\n'))
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty);

    return Column(
      crossAxisAlignment: .stretch,
      spacing: context.spacing.s12,
      children: [
        for (final paragraph in paragraphs)
          if (_bullet.hasMatch(paragraph))
            Padding(
              padding: EdgeInsetsDirectional.only(start: context.spacing.s8),
              child: Row(
                crossAxisAlignment: .start,
                spacing: context.spacing.s8,
                children: [
                  Text('•', style: style),
                  Expanded(child: Text(paragraph.replaceFirst(_bullet, ''), style: style)),
                ],
              ),
            )
          else
            Text(paragraph, style: style),
      ],
    );
  }
}

class _DocumentCard extends StatelessWidget {
  const _DocumentCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing.s24),
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s16),
          side: BorderSide(color: context.colors.strokePrimary),
        ),
        shadows: context.shadows.xs,
      ),
      child: child,
    );
  }
}

class _DocumentSkeleton extends StatelessWidget {
  const _DocumentSkeleton();

  @override
  Widget build(BuildContext context) {
    final style = context.typography.book14.copyWith(height: 1.6);

    return Skeleton(
      child: _DocumentCard(
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: context.spacing.s12,
          children: [
            for (final lines in const [3, 4, 2, 4, 3]) SkeletonText(style: style, lines: lines),
          ],
        ),
      ),
    );
  }
}
