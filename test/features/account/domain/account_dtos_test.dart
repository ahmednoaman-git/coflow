import 'package:coflow_users_v2/features/account/domain/domain.dart';
import 'package:coflow_users_v2/features/authentication/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('UpdateProfileDto sends the fields POST profile requires', () {
    final dto = UpdateProfileDto(
      name: 'Sara',
      email: 'sara@example.com',
      phone: '01000000000',
      birthdate: DateTime(2000, 1, 5),
      gender: Gender.female,
      nationality: 'EGY',
    );

    expect(dto.toJson(), {
      'name': 'Sara',
      'email': 'sara@example.com',
      'phone': '01000000000',
      'birthdate': '2000-01-05',
      'gender': 'female',
      'nationality': 'EGY',
    });
  });

  test('ChangePasswordDto sends new_password', () {
    expect(const ChangePasswordDto(newPassword: 'secret1').toJson(), {'new_password': 'secret1'});
  });
}
