class AuthEntity {
  final String message;
  final DataEntity data;


  const AuthEntity({
    required this.message,
    required this.data,

  });
}

class DataEntity {
  final String token;
  final String username;

  const DataEntity({
    required this.token,
    required this.username,
  });
}
