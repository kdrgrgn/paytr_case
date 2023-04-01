




import 'package:freezed_annotation/freezed_annotation.dart';
part 'countries.freezed.dart';
part 'countries.g.dart';
@freezed
class Countries with _$Countries{
  const factory Countries({
    required Map<String,dynamic> data,

  }) = _Countries;

  factory Countries.fromJson(Map<String, dynamic> json)
      => _$CountriesFromJson(json);
}


