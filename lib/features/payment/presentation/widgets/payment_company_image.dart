import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/services/url_launcher.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/utils/constants/app_urls.dart';

class PaymentCompanyImage extends StatelessWidget {
  const PaymentCompanyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await UrlLauncher.launcher(url: AppUrls.kFawaterakWebsite);
      },
      child: Container(
        width: (MediaQuery.of(context).size.width * 0.75).w,
        height: (MediaQuery.of(context).size.height * 0.20).h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          image: const DecorationImage(
            image: AssetImage(
              AppImages.kFawaterakLogo,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 48),
      ),
    );
  }
}
