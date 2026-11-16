import 'package:coflow_users_v2/features/my_purchases/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

UserPurchaseEntity _purchase({
  required int id,
  int facilityId = 1,
  String facilityName = 'Flow Profile',
  PurchaseKind kind = PurchaseKind.ticket,
  List<PurchasedAddOnEntity> addOns = const [],
  double price = 600,
  double addOnsPrice = 0,
  double couponDiscount = 0,
}) => UserPurchaseEntity(
  id: id,
  name: 'Row $id',
  kind: kind,
  status: PurchaseStatus.due,
  facilityId: facilityId,
  facilityName: facilityName,
  currency: 'EGP',
  quantity: 2,
  price: price,
  addOnsPrice: addOnsPrice,
  couponDiscount: couponDiscount,
  totalPrice: price + addOnsPrice,
  finalPrice: price + addOnsPrice - couponDiscount,
  tickets: const [PurchasedTicketEntity(id: 9, name: 'Aerial Flow Ticket', quantity: 2)],
  addOns: addOns,
);

void main() {
  group('PurchaseGrouping.byFacility', () {
    test('groups rows by facility in first-appearance order, keeping row order', () {
      final groups = PurchaseGrouping.byFacility([
        _purchase(id: 1, facilityId: 7, facilityName: 'Gravity'),
        _purchase(id: 2, facilityId: 3, facilityName: 'Calisthenics Club'),
        _purchase(id: 3, facilityId: 7, facilityName: 'Gravity'),
      ]);

      expect(groups.map((group) => group.facilityId), [7, 3]);
      expect(groups.first.facilityName, 'Gravity');
      expect(groups.first.purchases.map((row) => row.id), [1, 3]);
      expect(groups.last.purchases.map((row) => row.id), [2]);
    });

    test('an empty list has no groups', () {
      expect(PurchaseGrouping.byFacility(const []), isEmpty);
    });
  });

  group('UserPurchaseInvoice.of', () {
    String addOnLabel(String name) => 'Add-On: $name';

    test('lists the item, each add-on, the coupon and the total', () {
      final invoice = UserPurchaseInvoice.of(
        _purchase(
          id: 565,
          addOnsPrice: 200,
          couponDiscount: 80,
          addOns: const [PurchasedAddOnEntity(name: 'Mat', quantity: 2, price: 200)],
        ),
        addOnLabel: addOnLabel,
        addOnsLabel: 'Add-Ons Price',
      );

      expect(invoice.lines.map((line) => (line.label, line.quantity, line.amount)), [
        ('Aerial Flow Ticket', 2, 600.0),
        ('Add-On: Mat', 2, 200.0),
      ]);
      expect(invoice.couponDiscount, 80);
      expect(invoice.subtotal, 800);
      expect(invoice.total, 720);
      expect(invoice.currency, 'EGP');
    });

    test('folds add-ons into one line when they do not add up to the add-ons price', () {
      final invoice = UserPurchaseInvoice.of(
        _purchase(
          id: 1,
          addOnsPrice: 111,
          addOns: const [PurchasedAddOnEntity(name: 'Mat', price: 50)],
        ),
        addOnLabel: addOnLabel,
        addOnsLabel: 'Add-Ons Price',
      );

      expect(invoice.lines.last.label, 'Add-Ons Price');
      expect(invoice.lines.last.amount, 111);
    });

    test('names a promotion purchase after its promotion', () {
      final purchase = _purchase(id: 1, kind: PurchaseKind.package);
      expect(UserPurchaseInvoice.itemLabel(purchase), 'Row 1');
      expect(UserPurchaseInvoice.itemLabel(_purchase(id: 2)), 'Aerial Flow Ticket');
    });
  });
}
