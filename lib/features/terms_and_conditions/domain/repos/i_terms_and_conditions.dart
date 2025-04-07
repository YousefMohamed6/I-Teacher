import 'package:iteacher/features/terms_and_conditions/data/models/dashboard_model.dart';

abstract class ITermsAndConditionsRepo {
  Future<DashboardModel> fetchTermsAndConditions();
}
