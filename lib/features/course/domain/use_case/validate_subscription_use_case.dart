import 'package:firebase_auth/firebase_auth.dart';
import 'package:iteacher/core/exceptions/expired_subscription_exception.dart';
import 'package:iteacher/core/services/api_service.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/loacl_notification_service.dart';
import 'package:iteacher/core/services/router_manager.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/student_data/data/model/student_model.dart';
import 'package:iteacher/generated/app_localizations.dart';
import 'package:ntp/ntp.dart';

class ValidateSubscriptionUseCase {
  final FirebaseFirestoreService firebaseFirestoreService;
  final ApiService apiService;

  ValidateSubscriptionUseCase({
    required this.firebaseFirestoreService,
    required this.apiService,
  });
  Future<void> execute(StudentModel student) async {
    final date = await NTP.now();
    if (student.expiryDate.isBefore(date)) {
      await firebaseFirestoreService.deleteDocument(
        collectionId: StudentKeys.kStudentsCollection,
        documentId: student.email,
      );
      await FirebaseAuth.instance.currentUser?.delete();
      await FirebaseAuth.instance.signOut();
      throw ExpiredSubscriptionException();
    }
    if (student.expiryDate.difference(date).inDays < 3) {
      final NotificationService notificationService = NotificationService();
      await notificationService.showNotification(
        id: 1,
        title: AppLocalizations.of(RouterManager.navigatorKey.currentContext!)!
            .subscription_expired_date,
        body:
            '${AppLocalizations.of(RouterManager.navigatorKey.currentContext!)!.subscription_expired} ${student.expiryDate.toString().substring(0, 10)}',
      );
    }
  }
}
