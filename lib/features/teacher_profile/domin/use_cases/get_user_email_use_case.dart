import 'package:mrjoo/core/services/sf_service.dart';
import 'package:mrjoo/core/utils/constants/sf_keys.dart';

class GetUserEmailUseCase {
  Future<String> execute() async {
    return await SharedPreferencesService.getString(SfKeys.userEmail) ?? '';
  }
}
