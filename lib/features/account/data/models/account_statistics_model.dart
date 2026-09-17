import 'package:json_annotation/json_annotation.dart';

part 'account_statistics_model.g.dart';

/// The authenticated `account-statistics` response, after envelope extraction.
@JsonSerializable(checked: true)
class AccountStatisticsModel {
  const AccountStatisticsModel({
    required this.calendars,
    required this.purchases,
    required this.gifts,
    required this.profiles,
  });

  final int calendars;
  final int purchases;
  final int gifts;
  final int profiles;

  factory AccountStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountStatisticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountStatisticsModelToJson(this);
}
