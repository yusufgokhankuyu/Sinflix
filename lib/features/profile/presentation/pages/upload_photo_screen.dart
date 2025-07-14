import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:sinflix/core/network/dio_client.dart';
import 'package:sinflix/core/services/token_service.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/features/profile/data/user_repository.dart';
import 'package:sinflix/generated/l10n.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({Key? key}) : super(key: key);

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  File? _selectedImage;

  Future<void> _pickAndUploadPhoto(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      final file = File(picked.path);

      setState(() {
        _selectedImage = file;
      });
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0x1AFFFFFF),
                  border: Border.all(color: const Color(0x33FFFFFF), width: 1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              S.of(context).profileDetails,
              style: AppTextStyles.title,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoPicker(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _pickAndUploadPhoto(context),
        child: Container(
          width: 168.95,
          height: 164.30,
          decoration: BoxDecoration(
            color: AppColors.text10,
            border: Border.all(color: AppColors.text10, width: 1.55),
            borderRadius: BorderRadius.circular(32),
          ),
          child:
              _selectedImage == null
                  ? Center(
                    child: Icon(Icons.add, color: AppColors.text50, size: 45),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(32),

                    child: Image.file(
                      _selectedImage!,
                      width: 168.95,
                      height: 164.30,
                      fit: BoxFit.cover,
                    ),
                  ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                S.of(context).uploadPhoto,
                style: AppTextStyles.authTitle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Resources out incentivize relaxation floor loss cc.",
                style: AppTextStyles.authTitle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildPhotoPicker(context),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed:
                      _selectedImage != null
                          ? () async {
                            if (_selectedImage != null) {
                              final file = File(_selectedImage!.path);
                              final userRepository = UserRepository(
                                DioClient(TokenService()).dio,
                              );

                              await userRepository.uploadPhoto(file);

                              if (context.mounted) {
                                setState(() {});

                                Navigator.pop(context, true);
                              }
                            }
                          }
                          : null,
                  child: Text(
                    S.of(context).contuniue,
                    style: AppTextStyles.title.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
