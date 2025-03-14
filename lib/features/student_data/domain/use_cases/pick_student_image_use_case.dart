import 'package:mrjoo/core/services/image_picker_service.dart';

class PickStudentImageUseCase {
  final ImagePickerService imagePickerService;

  PickStudentImageUseCase(this.imagePickerService);

  Future<String> execute() async =>
      await imagePickerService.pickImageAsBase64FromGallery();
}
