

import 'package:injectable/injectable.dart';

import '../../domain/services/user_token_provider_service.dart';
import '../../services/local_storage/token_local_storage.dart';

@Injectable(as: UserTokenProviderService)
class UserTokenProviderServiceImpl implements UserTokenProviderService {
  UserTokenProviderServiceImpl({@ignoreParam TokenLocalStorage? localStorageService})
    : _localStorageService = localStorageService ?? TokenLocalStorage();

  final TokenLocalStorage _localStorageService;

  @override
  Future<String?>? get token async => _localStorageService.getAccessToken();

  @override
  Future<String?>? get authorizationHeader async {
    final t = await token;
    if (t == null) return null;
    return 'Bearer $t';
  }
}
