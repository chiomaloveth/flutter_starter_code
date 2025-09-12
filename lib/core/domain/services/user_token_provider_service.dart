abstract interface class UserTokenProviderService {
  Future<String?>? get token;
  Future<String?>? get authorizationHeader;
}
