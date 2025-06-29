import '../../domain/entities/home_entity.dart';
import '../../domain/entities/filter_entity.dart';

class FilterModel extends FilterEntity {
  const FilterModel({required super.message, required super.doctorList});

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      message: json['message'],
      doctorList:
          (json['data'] as List)
              .map((e) => DoctorListModel.fromJson(e))
              .toList(),
    );
  }
}

class DoctorListModel extends DoctorListEntity {
  const DoctorListModel({
    required super.cityEntity,
    required super.nameDoctor,
    required super.email,
    required super.phone,
    required super.image,
    required super.gender,
    required super.address,
    required super.description,
    required super.degree,
    required super.price,
    required super.doctorId,
    required super.startTime,
    required super.endTime,
  });

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
      cityEntity: CityModel.fromJson(json['city']),
      nameDoctor: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['photo'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      degree: json['degree'] ?? '',
      price: (json['appoint_price'] ?? 0).toString(),
      doctorId: json['id'] ?? 0,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
    );
  }
}

class CityModel extends CityEntity {
  const CityModel({ required super.id, required super.nameCity, required super.governrateEntity});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      nameCity: json['name'] ?? '',
      id: json['id'] ?? 0,
      governrateEntity: GovernrateModel.fromJson(json['governrate']),
    );
  }
}

class GovernrateModel extends GovernrateEntity {
  const GovernrateModel({required super.id, required super.nameGovernrate});

  factory GovernrateModel.fromJson(Map<String, dynamic> json) {
    return GovernrateModel(
      nameGovernrate: json['name'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
