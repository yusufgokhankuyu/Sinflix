import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinflix/core/services/locale_service.dart';
import 'package:sinflix/core/services/token_service.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:sinflix/features/profile/presentation/bloc/profile_event.dart';
import 'package:sinflix/features/profile/presentation/pages/upload_photo_screen.dart';
import 'package:sinflix/generated/l10n.dart';

Widget buildProfileSection(
  BuildContext context,
  String name,
  String email,
  String userId,
  String? photoUrl,
) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<String?>(
              future: TokenService().getUserPhoto(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                  );
                }
                final photoUrl = snapshot.data;
                return CircleAvatar(
                  radius: 31,
                  backgroundImage:
                      (photoUrl != null && photoUrl.isNotEmpty)
                          ? NetworkImage(photoUrl)
                          : null,
                  backgroundColor: const Color(0xFF222222),
                  child:
                      (photoUrl == null || photoUrl.isEmpty)
                          ? const Icon(
                            Icons.person,
                            size: 32,
                            color: Colors.white,
                          )
                          : null,
                );
              },
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyles.title),
                  const SizedBox(height: 4),
                  Text(
                    "ID: ${userId.substring(0, userId.length > 6 ? 6 : userId.length)}",
                    style: AppTextStyles.profileID,
                  ),
                ],
              ),
            ),

            Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.circular(9),
              ),
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UploadPhotoScreen(),
                    ),
                  );

                  if (result == true && context.mounted) {
                    context.read<ProfileBloc>().add(LoadUserProfile());
                  }
                },
                child: Center(
                  child: Text(
                    S.of(context).addPhoto,
                    style: AppTextStyles.title.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      final currentLocale =
                          context
                              .watch<LocaleCubit>()
                              .state
                              .locale
                              .languageCode;
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: AppColors.red,
                              size: 26,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                S.of(context).language,
                                style: AppTextStyles.title.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(
                                'English',
                                style: TextStyle(
                                  fontWeight:
                                      currentLocale == 'en'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color:
                                      currentLocale == 'en'
                                          ? AppColors.red
                                          : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              tileColor:
                                  currentLocale == 'en'
                                      ? AppColors.red.withOpacity(0.12)
                                      : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onTap: () {
                                S.load(const Locale('en'));
                                Navigator.of(context).pop();
                                context.read<LocaleCubit>().setLocale(
                                  AppLocale.en,
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            ListTile(
                              title: Text(
                                'Türkçe',
                                style: TextStyle(
                                  fontWeight:
                                      currentLocale == 'tr'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  color:
                                      currentLocale == 'tr'
                                          ? AppColors.red
                                          : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              tileColor:
                                  currentLocale == 'tr'
                                      ? AppColors.red.withOpacity(0.12)
                                      : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onTap: () {
                                S.load(const Locale('tr'));
                                Navigator.of(context).pop();
                                context.read<LocaleCubit>().setLocale(
                                  AppLocale.tr,
                                );
                              },
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              S.of(context).cancel,
                              style: const TextStyle(color: AppColors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 36,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.language, color: Colors.white),
                        Text(
                          S.of(context).language,
                          style: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  await TokenService().clearAll();
                  if (context.mounted) {
                    context.go('/splash');
                  }
                },
                child: Container(
                  height: 36,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, color: Colors.white, size: 20),
                        Text(
                          S.of(context).logout,
                          style: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
