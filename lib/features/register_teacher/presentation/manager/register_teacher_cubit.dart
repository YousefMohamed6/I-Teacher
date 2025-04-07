import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/core/exceptions/pick_image_exception.dart';
import 'package:iteacher/core/utils/helper/payment_manager.dart';
import 'package:iteacher/features/payment/data/models/payment/cart_item.dart';
import 'package:iteacher/features/payment/data/models/payment/payment.dart';
import 'package:iteacher/features/payment/data/models/payment/redirection_urls.dart';
import 'package:iteacher/features/payment/data/models/payment_opration_model.dart';
import 'package:iteacher/features/payment/domain/use_cases/save_payment_status_use_case.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/create_teacher_use_case.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/fetch_owner_data.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/pick_image_use_case.dart';
import 'package:iteacher/features/register_teacher/domain/use_cases/send_payment_request_teacher_use_case.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'register_teacher_cubit.freezed.dart';
part 'register_teacher_state.dart';

class RegisterTeacherCubit extends Cubit<RegisterTeacherState> {
  final SendPaymentRequestTeacherUseCase _sendPaymentRequestTeacher;
  final PickTeacherImageUseCase _pickTeacherImageUseCase;
  final SavePaymentStatusUseCase _savePaymentStatusUseCase;
  final CreateTeacherUseCase _createTeacherUseCase;
  final FetchOwnerDataUseCase _fetchOwnerDataUseCase;
  RegisterTeacherCubit(
    this._sendPaymentRequestTeacher,
    this._pickTeacherImageUseCase,
    this._savePaymentStatusUseCase,
    this._createTeacherUseCase,
    this._fetchOwnerDataUseCase,
  ) : super(RegisterTeacherState.initial());
  final formkey = GlobalKey<FormState>();
  final firstNameTextController = TextEditingController(text: 'Yassir');
  final lastNameTextController = TextEditingController(text: 'Abdelrahman');
  final emailTextController = TextEditingController(text: 'Yassir@gmail.com');
  final passwordTextController = TextEditingController(text: '123456');
  final phoneTextController = TextEditingController(text: '01012345678');
  final addressTextField = TextEditingController(text: 'Cairo');
  final teacherIdTextController = TextEditingController();
  final coursePriceTextController = TextEditingController();
  final channalIdTextController = TextEditingController();
  final departmentTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final paymentIdTextController = TextEditingController();
  final imageBase64TextController = TextEditingController();
  bool obscureText = true;
  void toggleObscureText() {
    emit(RegisterTeacherState.initial());
    obscureText = !obscureText;
    emit(RegisterTeacherState.updateUI());
  }

  TeacherModel get teacher => TeacherModel(
        firstName: firstNameTextController.text,
        lastName: lastNameTextController.text,
        email: emailTextController.text,
        phone: phoneTextController.text,
        address: addressTextField.text,
        department: departmentTextController.text,
        coursePrice: coursePriceTextController.text,
        description: descriptionTextController.text,
        channalId: channalIdTextController.text,
        teacherId: teacherId,
        paymentId: paymentIdTextController.text,
        accounts: {},
        imageBase64: imageBase64TextController.text,
      );

  String get teacherId => DateTime.now().millisecondsSinceEpoch.toString();
  Future<void> pickTeacherImage() async {
    try {
      emit(RegisterTeacherState.initial());
      imageBase64TextController.text = await _pickTeacherImageUseCase.execute();
      emit(RegisterTeacherState<TeacherModel>.updateUI());
    } on PickGalleryImageException catch (e) {
      emit(RegisterTeacherState<PickGalleryImageException>.error(e.toString()));
    }
  }

  Future<void> sendPaymentRequest() async {
    if (!formkey.currentState!.validate()) return;
    try {
      emit(RegisterTeacherState.loading());
      final owner = await _fetchOwnerDataUseCase.execute();
      final PaymentModel paymentModel = PaymentModel(
        cartItems: [
          CartItem(
            name: 'Teacher Registration Fee',
            price: owner.cost,
            quantity: "1",
          ),
        ],
        cartTotal: owner.cost,
        currency: "EGP",
        customer: teacher.toCustomer(),
        redirectionUrls: RedirectionUrls(
          successUrl: "https://dev.fawaterk.com/success",
          failUrl: "https://dev.fawaterk.com/fail",
          pendingUrl: "https://dev.fawaterk.com/pending",
        ),
      );
      final result = await _sendPaymentRequestTeacher.execute(
        paymentModel: paymentModel,
        token: owner.ownerPaymentId,
      );
      emit(RegisterTeacherState<String>.success(result.data?.url ?? ""));
    } catch (e) {
      emit(RegisterTeacherState.error(e.toString()));
    }
  }

  PaymentOprationModel get paymentOpration => PaymentOprationModel(
        invoiceId: '',
        paymentStatus: '',
        paymentDate: DateTime.now().toString(),
        firstName: teacher.firstName,
        lastName: teacher.lastName,
        email: teacher.email,
        phone: teacher.phone,
      );
  Future<void> checkPayment(UrlChange url) async {
    final String invoiceId =
        Uri.parse(url.url!).queryParameters['invoice_id'] ?? "";
    try {
      await PaymentManager.checkPayment(
        url: url,
        onSuccess: () async {
          emit(RegisterTeacherState.loading());
          await _savePaymentStatusUseCase.execute(
            PaymentOprationModel: paymentOpration
              ..invoiceId = invoiceId
              ..paymentStatus = 'success',
          );
          await _createTeacherUseCase.execute(
            teacher: teacher,
            password: passwordTextController.text,
          );
          emit(RegisterTeacherState<bool>.success(true));
        },
        onFail: () async {
          await _savePaymentStatusUseCase.execute(
            PaymentOprationModel: paymentOpration
              ..invoiceId = invoiceId
              ..paymentStatus = 'fail',
          );
          emit(RegisterTeacherState<bool>.error(''));
        },
      );
    } catch (e) {
      emit(RegisterTeacherState<String>.error(e.toString()));
    }
  }
}
