import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/student_data/data/model/customer_model.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());
  final fristName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CustomerModel? customerData;
  bool _isLoading = false;
  void changeStateLoading() {
    _isLoading = !_isLoading;
    _isLoading ? emit(SendData()) : emit(EnterData());
  }

  void addCustomer() {
    customerData = CustomerModel.fromJson({
      'fristName': fristName.text,
      'lastName': lastName.text,
      'email': email.text,
      'phone': phone.text,
    });
    emit(SendData());
  }
}
