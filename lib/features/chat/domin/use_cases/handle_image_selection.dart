import 'package:iteacher/core/models/user_model.dart';
import 'package:iteacher/core/services/image_picker_service.dart';
import 'package:iteacher/features/chat/data/models/image_message_model/image_message_model.dart';

class HandleImageSelectionUseCase {
  final ImagePickerService _imagePickerService;

  HandleImageSelectionUseCase(this._imagePickerService);
  Future<ImageMessageModel> execute({
    required UserModel userModel,
    required String reciverId,
  }) async {
    final image = await _imagePickerService.pickImageAsBase64FromGallery();
    final message = ImageMessageModel(
      userModel: userModel,
      imageBase64: image,
      createdAt: DateTime.now().toString(),
      reciverId: reciverId,
    );
    return message;
  }
}
