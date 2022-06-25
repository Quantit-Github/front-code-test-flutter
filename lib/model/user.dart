class User {
  final String userName;
  final String accessToken;
  final String refreshToken;

  const User({
    required this.userName,
    required this.accessToken,
    required this.refreshToken,
  });
}
