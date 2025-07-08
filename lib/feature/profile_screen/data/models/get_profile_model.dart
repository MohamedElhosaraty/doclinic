import '../../domain/entities/get_profile_entity.dart';

class GetProfileModel extends GetProfileEntity {
  const GetProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) {
    return GetProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
