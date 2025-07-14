import 'package:flutter/material.dart';
import 'package:sinflix/core/theme/color_scheme.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: AppColors.text10,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.text20, width: 0.5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: SizedBox(
          width: 54,
          height: 54,
          child: Icon(icon, color: Colors.white, size: 34),
        ),
      ),
    );
  }
}
