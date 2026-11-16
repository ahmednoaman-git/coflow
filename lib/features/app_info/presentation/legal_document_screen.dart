import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/legal_document_body.dart';
import 'cubit/app_info_cubit.dart';

/// The two legal texts `GET info` carries.
enum LegalDocument { terms, privacyPolicy }

/// Terms & Conditions or the Privacy Policy, as plain readable text.
@RoutePage()
class LegalDocumentScreen extends StatelessWidget {
  const LegalDocumentScreen({super.key, required this.document});

  final LegalDocument document;

  @override
  Widget build(BuildContext context) {
    final title = switch (document) {
      LegalDocument.terms => context.l10n.account_termsAndConditions,
      LegalDocument.privacyPolicy => context.l10n.account_privacyPolicy,
    };

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (_) => getIt<AppInfoCubit>(),
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: title, showBackButton: true),
          body: LegalDocumentBody(document: document),
        ),
      ),
    );
  }
}
