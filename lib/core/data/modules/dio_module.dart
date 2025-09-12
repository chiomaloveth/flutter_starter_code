import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:logging/logging.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/exceptions/error_context.dart';
import '../../domain/services/app_info_service.dart';
import '../../domain/services/user_token_provider_service.dart';
import '../config/environment.dart';
import '../datasources/apis/api_utils.dart';
import '../datasources/http_client_adapter_provider_web.dart'
    if (dart.library.io) '../datasources/http_client_adapter_provider_io.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(
    AppEnvironment environment,
    TokenInterceptor tokenInterceptor,
    AppendVersionHeaderInterceptor appendVersionHeaderInterceptor,
  ) =>
      Dio(BaseOptions(contentType: Headers.jsonContentType))
        ..httpClientAdapter = HttpClientAdapterProvider().create()
        ..interceptors.addAll([
          tokenInterceptor,
          appendVersionHeaderInterceptor,
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            logPrint: _logger.fine,
            enabled: environment == AppEnvironment.local,
          ),
        ]);

  static final Logger _logger = Logger('DioModule');
}

@lazySingleton
class TokenInterceptor extends QueuedInterceptor {
  TokenInterceptor(this.tokenProviderService);

  final UserTokenProviderService tokenProviderService;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra.containsKey(ApiUtils.unAuthenticated) && options.extra[ApiUtils.unAuthenticated] == true) {
      return handler.next(options);
    }

    final header = await tokenProviderService.authorizationHeader;
    if (header == null) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          error: const InvalidUserTokenFailure(),
          message: 'User token is invalid or does not exist',
        ),
      );
      return;
    }

    options.headers['Authorization'] = header; //HttpHeaders.authorizationHeader

    return handler.next(options);
  }
}

@lazySingleton
class AppendVersionHeaderInterceptor extends QueuedInterceptor {
  AppendVersionHeaderInterceptor(this.appInfoService);

  static const String appVersionHeader = 'X-App-Version';
  static const String appBuildNumberHeader = 'X-App-Build-Number';

  final AppInfoService appInfoService;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final appPackageInfo = await appInfoService.getPackageInfo();
    appPackageInfo.fold((_) {}, (packageInfo) {
      options.headers[appVersionHeader] = packageInfo.version;
      options.headers[appBuildNumberHeader] = packageInfo.buildNumber;
    });

    return handler.next(options);
  }
}
