import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_gpt/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:t_gpt/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: SplashBloc()..add(SplashLoading()),
      listener: (context, state) {
        if (state == const SplashState.init()) {}
        if (state == const SplashState.loading()) {}
        if (state == const SplashState.success()) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.onboarding, (route) => false);
        }
        if (state == const SplashState.error()) {}
      },
      child: Scaffold(
        backgroundColor: Colors.blueAccent.shade700,
        body: Center(
          child: Image.asset("assets/chat-bot.png"),
        ),
      ),
    );
  }
}
