import 'package:auto_route/auto_route.dart';
import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/components.dart';
import 'cubit/cubit.dart';

/// Search across businesses, instructors and services.
@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchCubit>(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: context.colors.backgroundTwo,
          appBar: BrandedAppBar(title: context.l10n.search_title, showBackButton: true),
          body: const SearchScreenBody(),
        ),
      ),
    );
  }
}
