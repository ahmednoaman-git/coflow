import 'package:coflow_users_v2/features/purchase/presentation/components/ticket_shape_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TicketShapeBorder', () {
    const rect = Rect.fromLTWH(0, 0, 300, 400);

    test('cuts transparent notches into the outer path when a tear line is set', () {
      const border = TicketShapeBorder(notchRadius: 16, notchCenterY: 200);
      final path = border.getOuterPath(rect);

      // A point on the left edge at the tear line falls inside the removed notch.
      expect(path.contains(const Offset(2, 200)), isFalse);
      // A point on the left edge away from the tear line stays part of the card.
      expect(path.contains(const Offset(2, 40)), isTrue);
    });

    test('has no notches before the tear line is measured', () {
      const border = TicketShapeBorder(notchRadius: 16);
      final path = border.getOuterPath(rect);

      expect(path.contains(const Offset(2, 200)), isTrue);
    });

    testWidgets('paints fill, stroke and shadow of a notched card without error', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: SizedBox(
              width: 300,
              height: 400,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFFFF),
                  shape: TicketShapeBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: Color(0xFFCCCCCC)),
                    notchRadius: 16,
                    notchCenterY: 200,
                  ),
                  shadows: [BoxShadow(color: Color(0x22000000), blurRadius: 8)],
                ),
              ),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
    });
  });
}
