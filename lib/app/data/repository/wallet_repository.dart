import '../models/wallet_model.dart';
import '../provider/wallet_provider.dart';

class WalletRepository {
  final WalletProvider apiWallet = WalletProvider();

  Future<WalletModel> getWallet(String token) async {
    return apiWallet.getWallet(token);
  }

  Future<String> setWallet(String token, String id, double amount) async {
    return apiWallet.setWallet(token, id, amount);
  }
}
