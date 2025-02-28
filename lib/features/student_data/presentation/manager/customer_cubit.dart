import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/student_data/data/model/customer_model.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());
  final fristNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final address = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CustomerModel? customerData;
  bool _isLoading = false;
  void changeStateLoading() {
    _isLoading = !_isLoading;
    _isLoading ? emit(SendData()) : emit(EnterData());
  }

  void addCustomer() {
    customerData = CustomerModel(
      firstName: fristNameTextController.text,
      lastName: lastNameTextController.text,
      email: emailTextController.text,
      phone: phoneTextController.text,
      address: address.text,
    );
    emit(SendData());
  }
}
