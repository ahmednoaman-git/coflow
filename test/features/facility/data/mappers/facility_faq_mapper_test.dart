import 'package:coflow_users_v2/features/facility/data/mappers/mappers.dart';
import 'package:coflow_users_v2/features/facility/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FacilityFaqModel model({
    int id = 1,
    String question = 'Question?',
    String answer = 'Answer.',
    int? sort,
    String? status = 'active',
  }) => FacilityFaqModel(
    id: id,
    question: question,
    answer: answer,
    sort: sort,
    status: status,
  );

  test('orders entries by the sort the facility chose', () {
    final faqs = FacilityFaqMapper.toEntities([
      model(id: 3, sort: 3),
      model(id: 1, sort: 1),
      model(id: 2, sort: 2),
    ]);

    expect(faqs.map((faq) => faq.id), [1, 2, 3]);
  });

  test('keeps entries the API left unsorted', () {
    // Facility 64 sends `"sort": 1` on every row; the list must survive that.
    final faqs = FacilityFaqMapper.toEntities([
      model(id: 1, sort: 1),
      model(id: 2, sort: 1),
      model(id: 3),
    ]);

    expect(faqs, hasLength(3));
  });

  test('drops unpublished and half-filled entries', () {
    final faqs = FacilityFaqMapper.toEntities([
      model(id: 1),
      model(id: 2, status: 'inactive'),
      model(id: 3, answer: '   '),
      model(id: 4, question: ''),
    ]);

    expect(faqs.map((faq) => faq.id), [1]);
  });

  test('trims whitespace the facility left in', () {
    final faq = FacilityFaqMapper.toEntities([
      model(question: '  Is it safe?  ', answer: '  Yes.  '),
    ]).single;

    expect(faq.question, 'Is it safe?');
    expect(faq.answer, 'Yes.');
  });
}
