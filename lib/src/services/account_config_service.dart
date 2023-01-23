import '../configs/constants.dart';
import '../models/http_response.dart';
import 'based_service_mixin.dart';
import '../factories/account_config_factory.dart';
import '../models/account_config.dart';

/// The service for the account configs.
/// It is used to handle the account configs.
class AccountConfigService with BasedServiceMixin {
  /// Returns the [AccountConfig] object if the request is successful using the [AccountConfigFactory].
  Future<AccountConfig> getAccountConfig({required String pubKey}) async {
    AccountConfig accountConfig;
    try {
      final HttpResponse response = await httpAdapter.get(
        url: Constants.endpoints.configUrl + pubKey,
      );
      accountConfig = AccountConfigFactory.fromResponse(response);
    } catch (e) {
      accountConfig = AccountConfig.fromMessage(e.toString(), success: false);
    }

    return accountConfig;
  }
}
