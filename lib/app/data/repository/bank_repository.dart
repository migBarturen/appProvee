import '../models/bank_model.dart';
import '../provider/bank_provider.dart';

class BankRepository {
  final BankProvider apiBank = BankProvider();
  Future<List<BankModel>> getBanks(String token) async {
    return apiBank.getBanks(token);
  }
}
