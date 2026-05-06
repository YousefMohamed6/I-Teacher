import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/chat/data/models/sign_sticker_model.dart';
import 'package:iteacher/generated/app_localizations.dart';

class SignStickersGrid extends StatelessWidget {
  final Function(SignStickerModel) onStickerSelected;
  const SignStickersGrid({super.key, required this.onStickerSelected});

  @override
  Widget build(BuildContext context) {
    // Mock data for production demonstration
    final List<SignStickerModel> stickers = [
      SignStickerModel(
        id: '1',
        url: 'assets/stickers/hello.gif',
        labelEn: 'Hello',
        labelAr: 'مرحباً',
        category: 'Common',
      ),
      SignStickerModel(
        id: '2',
        url: 'assets/stickers/thank_you.gif',
        labelEn: 'Thank You',
        labelAr: 'شكراً لك',
        category: 'Common',
      ),
      SignStickerModel(
        id: '3',
        url: 'assets/stickers/help.gif',
        labelEn: 'Help',
        labelAr: 'مساعدة',
        category: 'Educational',
      ),
    ];

    return Container(
      height: 300.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          CustomText(
            text: AppLocalizations.of(context)!.sign_language_support,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
              ),
              itemCount: stickers.length,
              itemBuilder: (context, index) {
                final sticker = stickers[index];
                final localLabel =
                    Localizations.localeOf(context).languageCode == 'ar'
                        ? sticker.labelAr
                        : sticker.labelEn;

                return GestureDetector(
                  onTap: () => onStickerSelected(sticker),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: const Icon(Icons.image,
                              color: Colors.grey), // Placeholder for actual GIF
                        ),
                      ),
                      SizedBox(height: 4.h),
                      CustomText(text: localLabel, fontSize: 12.sp),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
