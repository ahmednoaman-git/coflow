import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import 'service_ticket_row.dart';

/// The conditional sections shown once service details have loaded:
/// Description, Requirements, Conditions, Locations, Instructors, Pricing.
class ServiceDetailsSections extends StatelessWidget {
  const ServiceDetailsSections({super.key, required this.details});

  final FacilityServiceDetailsEntity details;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final sections = <Widget>[
      if (details.description case final description? when description.isNotEmpty)
        _Section(title: l10n.facilityDetails_descriptionLabel, child: _BodyText(description)),
      if (details.requirements case final requirements? when requirements.isNotEmpty)
        _Section(title: l10n.facilityDetails_requirements, child: _BodyText(requirements)),
      if (details.conditions case final conditions? when conditions.isNotEmpty)
        _Section(title: l10n.facilityDetails_conditions, child: _BodyText(conditions)),
      if (details.locations.isNotEmpty)
        _Section(
          title: l10n.facilityDetails_locationsSectionTitle,
          child: _BodyText(details.locations.map((l) => l.name).join(', ')),
        ),
      if (details.instructors.isNotEmpty)
        _Section(
          title: l10n.facilityDetails_instructorsSectionTitle,
          child: _BodyText(details.instructors.map((i) => i.fullName).join(', ')),
        ),
      if (details.tickets.isNotEmpty)
        _Section(
          title: l10n.facilityDetails_pricingTab,
          child: Column(
            children: [for (final ticket in details.tickets) ServiceTicketRow(ticket: ticket)],
          ),
        ),
    ];

    return Column(
      crossAxisAlignment: .start,
      children: [
        for (final (index, section) in sections.indexed) ...[
          if (index > 0) Divider(height: context.spacing.s32, color: context.colors.strokePrimary),
          section,
        ],
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: context.spacing.s8,
      children: [
        Text(title, style: context.typography.bold16.primary(context)),
        child,
      ],
    );
  }
}

class _BodyText extends StatelessWidget {
  const _BodyText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.typography.book14.secondary(context));
  }
}
