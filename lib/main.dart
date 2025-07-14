import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinflix/app.dart';
import 'package:sinflix/core/network/dio_client.dart';
import 'package:sinflix/core/services/locale_service.dart';
import 'package:sinflix/core/services/token_service.dart';
import 'package:sinflix/features/auth/data/auth_repository.dart';
import 'package:sinflix/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sinflix/firebase_options.dart';

late final AuthBloc authBloc;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final tokenService = TokenService();
  final dio = DioClient(tokenService).dio;

  authBloc = AuthBloc(AuthRepository(dio), tokenService);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      ],
      child: const SinflixApp(),
    ),
  );
}
