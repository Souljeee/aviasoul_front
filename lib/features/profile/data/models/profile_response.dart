import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String id;
  final String firstName;
  final String lastName;
  final String dtBirth;
  final String email;
  final String passportDetails;

  ProfileResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dtBirth,
    required this.email,
    required this.passportDetails,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
}
