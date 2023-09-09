import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_state.dart';
import 'package:mrjoo/features/customer/data/model/customer_model.dart';

class CustomerCubit extends Cubit<CustomerPageState> {
  CustomerCubit() : super(EnterData());
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

  void customer() {
    customerData = CustomerModel.fromUser({
      'fristName': fristName.text,
      'lastName': lastName.text,
      'email': email.text,
      'phone': phone.text,
    });
    emit(SendData());
  }
}
