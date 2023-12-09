import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  final bool accessAllowed;
  final String? message;

  RegistrationResponse({
    required this.accessAllowed,
    this.message,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => _$RegistrationResponseFromJson(json);
}
