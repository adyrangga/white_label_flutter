import 'package:white_label_flutter/data/network/endpoints.dart';
import 'package:white_label_flutter/data/network/rest_client.dart';
import 'package:white_label_flutter/models/accounts/accounts_model.dart';

class AccountsViewModel {
  RestClient resClient = RestClient();
  // var getRes = await rc.get(Endpoints.getAccounts);
  Future<List<AccountsModel>> getAccounts() async {
    final response = await resClient.get(Endpoints.getAccounts);
    return profileFromJson(response.toString());
  }
}