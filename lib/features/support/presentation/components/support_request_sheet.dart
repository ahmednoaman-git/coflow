import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../domain/entities/entities.dart';
import 'support_status_chip.dart';

/// A request's details, as in the design: number, date and status on top, then
/// the issue, the attached image (opens full screen) and the admin's note.
class SupportRequestSheet extends StatelessWidget {
  const SupportRequestSheet({super.key, required this.request});

  final SupportRequestEntity request;

  static Future<void> show(BuildContext context, SupportRequestEntity request) =>
      showMainBottomSheet<void>(
        context: context,
        builder: (_) => SupportRequestSheet(request: request),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final createdAt = request.createdAt;
    final imageUrl = request.imageUrl;
    final divider = Divider(height: 1, thickness: 1, color: context.colors.strokePrimary);

    return SafeArea(
      top: false,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.85),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: context.spacing.s24),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(context.spacing.s24),
                child: Column(
                  spacing: context.spacing.s8,
                  children: [
                    Text(
                      l10n.support_requestTitle(request.id),
                      textAlign: .center,
                      style: context.typography.bold20.primary(context),
                    ),
                    if (createdAt != null)
                      Text(
                        DateFormat.yMMMd(context.locale.toLanguageTag()).add_jm().format(createdAt),
                        style: context.typography.book14.tertiary(context),
                      ),
                    SupportStatusChip(request: request),
                  ],
                ),
              ),
              divider,
              _Section(
                title: l10n.support_issue,
                child: _Body(request.issue),
              ),
              if (imageUrl != null)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    context.spacing.s24,
                    0,
                    context.spacing.s24,
                    context.spacing.s16,
                  ),
                  child: TappableScale(
                    borderRadius: BorderRadius.circular(context.spacing.s8),
                    onTap: () => _SupportImageViewer.show(context, imageUrl),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.support_image,
                            style: context.typography.medium16.primary(context),
                          ),
                        ),
                        Icon(
                          SolarIconsOutline.eye,
                          color: context.colors.seaCaribbeanPrimary,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              divider,
              _Section(
                title: l10n.support_adminNote,
                child: switch (request.adminNote) {
                  final note? => _Body(note),
                  null => Text(
                    l10n.support_noReplyYet,
                    style: context.typography.book14.disabled(context),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s24),
      child: Column(
        crossAxisAlignment: .start,
        spacing: context.spacing.s12,
        children: [
          Text(title, style: context.typography.medium16.primary(context)),
          child,
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.typography.book14.tertiary(context).copyWith(height: 1.5));
  }
}

/// The attached image over a dark scrim, pinch-zoomable; tap or Back closes it.
class _SupportImageViewer extends StatelessWidget {
  const _SupportImageViewer({required this.imageUrl});

  final String imageUrl;

  static Future<void> show(BuildContext context, String imageUrl) => showDialog<void>(
    context: context,
    barrierColor: context.colors.signatureBlue.withValues(alpha: 0.92),
    builder: (_) => _SupportImageViewer(imageUrl: imageUrl),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: InteractiveViewer(
        maxScale: 4,
        child: Center(
          child: ShimmerImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            fallback: ImageFallback.icon(SolarIconsOutline.gallery),
          ),
        ),
      ),
    );
  }
}
