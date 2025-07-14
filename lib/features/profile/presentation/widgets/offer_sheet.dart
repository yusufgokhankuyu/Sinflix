// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/generated/l10n.dart';

Future<dynamic> offer_sheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF090909), Color(0xFF6F060B), Color(0xFF090909)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Text(
                  S.of(context).offer,
                  style: AppTextStyles.title.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  S.of(context).offerDescription,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white24, width: 0.5),
                      ),

                      child: Column(
                        children: [
                          Text(
                            S.of(context).bonusDescription,
                            style: AppTextStyles.title.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _BonusCircle(
                                icon: "premium",
                                label: S.of(context).premium,
                              ),
                              _BonusCircle(
                                icon: "more_match",
                                label: S.of(context).moreMatches,
                              ),
                              _BonusCircle(
                                icon: "highlights",
                                label: S.of(context).higlights,
                              ),
                              _BonusCircle(
                                icon: "more_like",
                                label: S.of(context).moreLikes,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).choosePlan,
                style: AppTextStyles.title.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),

              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  children: [
                    _JetonPackageCard(
                      bonus: "+10%",
                      oldAmount: "200",
                      newAmount: "330",
                      price: "₺99,99",
                      label: S.of(context).perWeek,
                      backgroundGradient: LinearGradient(
                        colors: [Color(0xFFE50914), Color(0xFF6F060B)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    const SizedBox(width: 10),
                    _JetonPackageCard(
                      bonus: "+70%",
                      oldAmount: "2.000",
                      newAmount: "3.379",
                      price: "₺799,99",
                      label: S.of(context).perWeek,
                      backgroundGradient: LinearGradient(
                        colors: [Color(0xFF5949E6), Color(0xFFE50914)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      bonusGradient: LinearGradient(
                        colors: [Color(0xFF5949E6), Color(0xFF5949E6)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    const SizedBox(width: 10),
                    _JetonPackageCard(
                      bonus: "+35%",
                      oldAmount: "1.000",
                      newAmount: "1.350",
                      price: "₺399,99",
                      label: S.of(context).perWeek,
                      backgroundGradient: LinearGradient(
                        colors: [Color(0xFFE50914), Color(0xFF6F060B)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: Text(
                      S.of(context).seeAllJetons,
                      style: AppTextStyles.title.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
    },
  );
}

class _BonusCircle extends StatelessWidget {
  final String icon;
  final String label;

  const _BonusCircle({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF6F060B),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.25),
                  blurRadius: 5,
                  spreadRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Image.asset('assets/icons/$icon.png', width: 35, height: 35),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.profileID.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _JetonPackageCard extends StatelessWidget {
  final String bonus;
  final String oldAmount;
  final String newAmount;
  final String price;
  final String label;
  final Gradient? backgroundGradient;
  final Gradient? bonusGradient;

  const _JetonPackageCard({
    Key? key,
    required this.bonus,
    required this.oldAmount,
    required this.newAmount,
    required this.price,
    required this.label,
    this.backgroundGradient,
    this.bonusGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              gradient:
                  backgroundGradient ??
                  LinearGradient(
                    colors: [const Color(0xFF6F060B), const Color(0xFF090909)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$oldAmount",
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    decoration: TextDecoration.lineThrough,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),

                Text(
                  "$newAmount",
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Jeton",
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Divider(color: Colors.white.withOpacity(0.1)),
                Spacer(),

                Text(
                  price,
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),

                Text(
                  label,
                  style: AppTextStyles.profileID.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          Positioned(
            top: 10,
            child: Container(
              width: 60,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient:
                    bonusGradient ??
                    LinearGradient(
                      colors: [AppColors.red, const Color(0xFFB31217)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                bonus,
                style: AppTextStyles.title.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
