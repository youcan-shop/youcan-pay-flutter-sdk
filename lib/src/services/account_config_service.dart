import '../configs/constants.dart';
import '../models/http_response.dart';
import '../services/based_service.dart';
import '../factories/account_config_factory.dart';
import '../models/account_config.dart';

class AccountConfigService extends BasedService {
  late AccountConfig accountConfig;

  Future<AccountConfig> getAccountConfig({required String pubKey}) async {
    try {
      HttpResponse response = await httpAdapter.get(url: Constants.CONFIG_URL + pubKey);
      accountConfig = AccountConfigFactory.fromJSON(response);
    } catch (e) {
      accountConfig = AccountConfig(success: false, message: e.toString());
    }

    return accountConfig;
  }
}
