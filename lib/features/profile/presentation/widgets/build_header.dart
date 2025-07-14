import 'package:flutter/material.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/features/profile/presentation/widgets/offer_sheet.dart';
import 'package:sinflix/generated/l10n.dart';

Widget buildHeader(
  BuildContext context,
  String userName,
  String userId,
  VoidCallback onBackToHome,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 24),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => onBackToHome(),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0x1AFFFFFF),
                border: Border.all(color: const Color(0x33FFFFFF), width: 1),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.arrow_back, color: Colors.white, size: 27),
              ),
            ),
          ),
        ),

        Center(
          child: Text(S.of(context).profileDetails, style: AppTextStyles.title),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () async {
              offer_sheet(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.diamond, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Text(
                        S.of(context).offer,
                        style: AppTextStyles.title.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
