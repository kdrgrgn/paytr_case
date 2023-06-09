import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';
@freezed
class User with _$User {
  const factory User({
    required String userName,
    required String name,
    required String surname,
    required String mail,
    required int age,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json)
      => _$UserFromJson(json);
}