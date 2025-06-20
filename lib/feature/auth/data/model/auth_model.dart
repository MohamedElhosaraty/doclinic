import '../../domain/entites/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.message,
    required super.data,

  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      message: json['message'],
      data: DataModel.fromJson(json['data']),
    );
  }
}

class DataModel extends DataEntity {
  const DataModel({
    required super.token,
    required super.username,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      token: json['token'],
      username: json['username'],
    );
  }


}
