import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';

part 'privacy_policy_cubit.freezed.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit() : super(PrivacyPolicyState.initial());
  final CollectionReference reference =
      FirebaseFirestore.instance.collection(AppKeys.kTremsAndPrivacy);
  String terms = '';
  String privacy = '';
  Future<void> fetchTremsAndPrivacy({
    required bool isArabic,
  }) async {
    emit(Loading());
    try {
      var collection = await reference.get();
      var docs = collection.docs;
      var doc = docs[0];
      var enTrems = doc['termsEn'];
      var arTrems = doc['termsAr'];
      terms = isArabic ? arTrems : enTrems;
      var enPrivacy = doc['privacyEn'];
      var arPrivacy = doc['privacyAr'];
      privacy = isArabic ? arPrivacy : enPrivacy;
      emit(PrivacyPolicyState<String>.success(privacy));
    } catch (e) {
      emit(PrivacyPolicyState.error(e.toString()));
    }
  }
}
