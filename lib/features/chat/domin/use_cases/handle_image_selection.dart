import 'package:iteacher/core/services/image_picker_service.dart';
import 'package:iteacher/features/chat/data/models/image_message_model/image_message_model.dart';

class HandleImageSelectionUseCase {
  final ImagePickerService _imagePickerService;

  HandleImageSelectionUseCase(this._imagePickerService);
  Future<ImageMessageModel> execute({
    required String senderId,
    required String reciverId,
  }) async {
    final image = await _imagePickerService.pickImageAsBase64FromGallery();
    final message = ImageMessageModel(
      senderId: senderId,
      imageBase64: image,
      createdAt: DateTime.now().toString(),
      reciverId: reciverId,
    );
    return message;
  }
}
