import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/features/customer/data/model/customer_model.dart';
import 'package:mrjoo/features/customer/presentation/manager/customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());
  var fristName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  CustomerModel? customerData;
  bool _isLoading = false;
  void changeStateLoading() {
    _isLoading = !_isLoading;
    _isLoading ? emit(SendData()) : emit(EnterData());
  }

  String terms = '';
  String privacy = '';
  // ignore: prefer_typing_uninitialized_variables
  CollectionReference reference =
      FirebaseFirestore.instance.collection(AppKeys.kTremsAndPrivacy);

  void addCustomer() {
    customerData = CustomerModel.fromUser({
      'fristName': fristName.text,
      'lastName': lastName.text,
      'email': email.text,
      'phone': phone.text,
    });
    emit(SendData());
  }

  Future<void> fetchTremsAndPrivacy({required String language}) async {
    emit(Loading());
    try {
      var collection = await reference.get();
      var docs = collection.docs;
      var doc = docs[0];
      var enTrems = doc['termsEn'];
      var arTrems = doc['termsAr'];
      terms = language == 'ar' ? arTrems : enTrems;
      var enPrivacy = doc['privacyEn'];
      var arPrivacy = doc['privacyAr'];
      privacy = language == 'ar' ? arPrivacy : enPrivacy;
      emit(CustomerInitial());
    } catch (_) {
      emit(Failure());
    }
  }
}
