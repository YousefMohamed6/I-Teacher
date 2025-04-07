import 'package:iteacher/core/services/image_picker_service.dart';

class PickTeacherImageUseCase {
  final ImagePickerService imagePickerService;
  PickTeacherImageUseCase(this.imagePickerService);

  Future<String> execute() async =>
      await imagePickerService.pickImageAsBase64FromGallery();
}
