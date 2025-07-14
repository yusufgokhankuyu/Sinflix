import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sinflix/features/auth/presentation/bloc/auth_state.dart';
import 'package:sinflix/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:sinflix/features/auth/presentation/widgets/social_button.dart';
import 'package:sinflix/generated/l10n.dart';

import '../bloc/auth_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
          ),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
              } else if (state is AuthSuccess) {
                context.go('/home');
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    S.of(context).loginWelcome,
                    style: AppTextStyles.authTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Tempus varius a vitae interdum id \ntortor elementum tristique eleifend at.",
                    style: AppTextStyles.authDescription,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 36),
                  CustomTextField(
                    icon: Icons.email_outlined,
                    hint: S.of(context).email,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 18),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    hint: S.of(context).password,
                    obscureText: true,
                    controller: _passwordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Text(
                        S.of(context).forgotPassword,
                        style: AppTextStyles.authTitle.copyWith(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();

                        if (email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(S.of(context).enterEmailPassword),
                            ),
                          );
                          return;
                        }

                        context.read<AuthBloc>().add(
                          LoginRequested(email, password),
                        );
                      },
                      child: Text(
                        S.of(context).login,
                        style: AppTextStyles.authTitle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: Icons.g_mobiledata_outlined,
                        onTap: () {},
                      ),
                      const SizedBox(width: 18),
                      SocialButton(icon: Icons.apple_outlined, onTap: () {}),
                      const SizedBox(width: 18),
                      SocialButton(icon: Icons.facebook, onTap: () {}),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${S.of(context).donthaveAccount} ",
                        style: AppTextStyles.authTitle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.text50,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/register');
                        },
                        child: Text(
                          S.of(context).signup,
                          style: AppTextStyles.authTitle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
