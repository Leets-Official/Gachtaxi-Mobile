class AuthResult {
  final String? status;
  final Map<String, dynamic>? user;
  final bool isUnregistered;

  const AuthResult({
    required this.status,
    required this.user,
    required this.isUnregistered,
  });
}
