import '../configs/constants.dart';
import '../models/http_response.dart';
import '../services/based_service.dart';
import '../factories/account_config_factory.dart';
import '../models/account_config.dart';

class AccountConfigService extends BasedService {
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
