import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import 'search_field.dart';
import 'search_results_view.dart';
import 'search_type_selector.dart';

/// Query field and tab selector pinned above the results list.
class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.spacing.s16,
            context.spacing.s24,
            context.spacing.s16,
            context.spacing.s12,
          ),
          child: Column(
            spacing: context.spacing.s12,
            children: [
              SearchField(onChanged: cubit.queryChanged),
              BlocBuilder<SearchCubit, SearchState>(
                buildWhen: (previous, current) =>
                    previous.selectedType != current.selectedType ||
                    previous.businessesRequest != current.businessesRequest ||
                    previous.instructorsRequest != current.instructorsRequest ||
                    previous.servicesRequest != current.servicesRequest,
                builder: (context, state) => SearchTypeSelector(
                  selectedType: state.selectedType,
                  onTypeSelected: cubit.typeSelected,
                  countFor: state.countFor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing.s16),
            child: const SearchResultsView(),
          ),
        ),
      ],
    );
  }
}
