import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/core/services/sf_service.dart';
import 'package:mrjoo/core/utils/constants/sf_keys.dart';
import 'package:mrjoo/features/terms_and_conditions/domain/use_cases/terms_and_conditions_use_case.dart';

part 'terms_and_conditions.freezed.dart';
part 'terms_and_conditions_state.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState> {
  final TermsAndConditionsUseCase _termsAndConditionsUseCase;
  TermsAndConditionsCubit(this._termsAndConditionsUseCase)
      : super(TermsAndConditionsState.initial());
  Future<void> fetchTermsAndConditions() async {
    try {
      emit(TermsAndConditionsState.loading());
      final termsAndConditions = await _termsAndConditionsUseCase.execute();
      final terms = await getIsArabic()
          ? termsAndConditions.arabicTerms
          : termsAndConditions.englishTerms;
      emit(TermsAndConditionsState<String>.success(terms));
    } catch (e) {
      emit(TermsAndConditionsState.error(e.toString()));
    }
  }

  Future<bool> getIsArabic() async {
    final String? local =
        await SharedPreferencesService.getString(SfKeys.local);
    return local == 'ar';
  }
}
