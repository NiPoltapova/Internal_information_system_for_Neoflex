import 'package:jwt_decode/jwt_decode.dart';
import '../auth_repository_impl.dart';

class UserService {
  final SecureStorage _storage;

  UserService(this._storage);

  Future<UserProfile?> getUserProfile() async {
    final idToken = await _storage.read(key: 'id_token');
    if (idToken == null) return null;

    try {
      final payload = Jwt.parseJwt(idToken);
      return UserProfile.fromJson(payload);
    } catch (e) {
      print('Error decoding JWT: $e');
      return null;
    }
  }

  Future<String?> getUserName() async {
    final profile = await getUserProfile();
    return profile?.sub;
  }
}

class UserProfile {
  // Основные поля
  final String sub;
  final String aud;
  final String azp;
  final String iss;
  final String jti;
  final String sid;

  // Временные метки
  final int authTime;
  final int exp;
  final int iat;

  // Опциональные поля
  final String? email;
  final String? name;
  final String? username;
  final String role;

  UserProfile({
    required this.sub,
    required this.aud,
    required this.azp,
    required this.iss,
    required this.jti,
    required this.sid,
    required this.authTime,
    required this.exp,
    required this.iat,
    required this.role,
    this.email,
    this.name,
    this.username,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        sub: json['sub'] as String,
        aud: json['aud'] as String,
        azp: json['azp'] as String,
        iss: json['iss'] as String,
        jti: json['jti'] as String,
        sid: json['sid'] as String,
        authTime: json['auth_time'] as int,
        exp: json['exp'] as int,
        iat: json['iat'] as int,
        role: json['role'] as String? ?? 'ROLE_GUEST',
        email: json['email'] as String?,
        name: json['name'] as String?,
        username: json['preferred_username'] as String?,
      );

  // Метод для получения времени экспирации в DateTime
  DateTime get expirationDateTime =>
      DateTime.fromMillisecondsSinceEpoch(exp * 1000);

  // Метод для проверки срока действия
  bool get isExpired => DateTime.now().isAfter(expirationDateTime);

  @override
  String toString() => '''
UserProfile(
  sub: $sub,
  role: $role,
  aud: $aud,
  azp: $azp,
  iss: $iss,
  authTime: ${DateTime.fromMillisecondsSinceEpoch(authTime * 1000)},
  expires: $expirationDateTime,
  sid: $sid,
  username: $username,
  email: $email,
  name: $name
)
''';
}