import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_promotion_ticket_line_entity.freezed.dart';

@freezed
abstract class FacilityPromotionTicketLineEntity with _$FacilityPromotionTicketLineEntity {
  const FacilityPromotionTicketLineEntity._();

  const factory FacilityPromotionTicketLineEntity({
    required String name,
    int? count,
    @Default(false) bool unlimited,
  }) = _FacilityPromotionTicketLineEntity;

  String? get quantityText => switch ((unlimited, count)) {
    (true, _) => '∞',
    (false, final count?) => count.toString(),
    (false, null) => null,
  };
}
