import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinflix/core/theme/color_scheme.dart';
import 'package:sinflix/core/theme/text_styles.dart';
import 'package:sinflix/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sinflix/features/auth/presentation/bloc/auth_event.dart';
import 'package:sinflix/features/auth/presentation/bloc/auth_state.dart';
import 'package:sinflix/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:sinflix/features/auth/presentation/widgets/social_button.dart';
import 'package:sinflix/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.13,
        ),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
            } else if (state is AuthSuccess) {
              context.go('/login');
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            S.of(context).registerWelcome,
                            style: AppTextStyles.authTitle,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
                            style: AppTextStyles.authDescription,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          CustomTextField(
                            icon: Icons.person,
                            hint: S.of(context).nameSurname,
                            controller: _nameController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            icon: Icons.email,
                            hint: S.of(context).email,
                            controller: _emailController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            icon: Icons.lock,
                            hint: S.of(context).password,
                            obscureText: true,
                            isPassword: true,
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            icon: Icons.lock_outline,
                            hint: S.of(context).confirmPassword,
                            obscureText: true,
                            controller: _confirmPasswordController,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            S.of(context).userPolicy,
                            style: AppTextStyles.authTitle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.text50,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE50914),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {
                                final name = _nameController.text.trim();
                                final email = _emailController.text.trim();
                                final password =
                                    _passwordController.text.trim();

                                if (name.isEmpty ||
                                    email.isEmpty ||
                                    password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        S.of(context).fillAllFields,
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                context.read<AuthBloc>().add(
                                  RegisterRequested(
                                    name: name,
                                    email: email,
                                    password: password,
                                  ),
                                );
                              },
                              child: Text(
                                S.of(context).signupNow,
                                style: AppTextStyles.authTitle.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialButton(
                                icon: Icons.g_mobiledata,
                                onTap: () {},
                              ),
                              const SizedBox(width: 16),
                              SocialButton(icon: Icons.apple, onTap: () {}),
                              const SizedBox(width: 16),
                              SocialButton(icon: Icons.facebook, onTap: () {}),
                            ],
                          ),
                          const Spacer(),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: AppTextStyles.authTitle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.text50,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "${S.of(context).alreadyHaveAccount} ",
                                    ),
                                    TextSpan(
                                      text: "${S.of(context).login}!",
                                      style: AppTextStyles.authTitle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
