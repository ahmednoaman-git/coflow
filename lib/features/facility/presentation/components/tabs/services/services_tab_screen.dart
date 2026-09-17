import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../domain/enums/enums.dart';
import '../../../cubit/cubit.dart';
import 'components/service_folder_tile.dart';
import 'components/service_tile.dart';
import 'components/services_empty_state.dart';
import 'components/services_shimmer.dart';

/// Renders a facility's Activities/Flows/Courses tab.
///
/// Every listing type is grouped the same way: folders render as expandable
/// tiles, with the first folder expanded by default, followed by root-level
/// services.
class ServicesTabScreen extends StatefulWidget {
  const ServicesTabScreen({super.key, required this.type});

  final FacilityServiceType type;

  @override
  State<ServicesTabScreen> createState() => _ServicesTabScreenState();
}

class _ServicesTabScreenState extends State<ServicesTabScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FacilityDetailsCubit>().ensureServicesLoaded(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing.s16),
      child: AsyncHandler<FacilityDetailsCubit, FacilityDetailsState, FacilityServicesEntity>(
        requestManagerGetter: (cubit) => cubit.servicesManagerFor(widget.type),
        loadingBuilder: (context) => const ServicesShimmer(),
        onRetry: (cubit) => cubit.refreshServices(widget.type),
        successBuilder: (context, services) {
          if (services.isEmpty) {
            return ServicesEmptyState(type: widget.type);
          }

          return Column(
            spacing: context.spacing.s12,
            children: [
              for (final (index, folder) in services.folders.indexed)
                ServiceFolderTile(
                  folder: folder,
                  type: widget.type,
                  initiallyExpanded: index == 0,
                ),
              for (final service in services.rootServices)
                ServiceTile(service: service, type: widget.type),
            ],
          );
        },
      ),
    );
  }
}
