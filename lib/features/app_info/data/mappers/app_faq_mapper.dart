import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract final class AppFaqMapper {
  /// The `type` of the entries written for this app.
  static const String customersType = 'customers';
  static const String activeStatus = 'active';

  /// Keeps the active customer entries (`admin-faq` also returns the facility
  /// dashboards' ones), ordered by their sort value, then by id.
  static List<AppFaqEntity> toCustomerFaqs(List<AppFaqModel> models) {
    final published =
        models
            .where((model) => model.type == customersType && model.status == activeStatus)
            .toList()
          ..sort((a, b) {
            final bySort = (a.sort ?? 0).compareTo(b.sort ?? 0);
            return bySort != 0 ? bySort : a.id.compareTo(b.id);
          });

    return [
      for (final model in published)
        AppFaqEntity(id: model.id, question: model.question.trim(), answer: model.answer.trim()),
    ];
  }
}
