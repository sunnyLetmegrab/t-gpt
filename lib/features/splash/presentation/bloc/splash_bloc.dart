import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.init()) {
    on<SplashLoading>(onLoadingCalled);
    on<SplashSuccess>((event, emit) {});
  }
  onLoadingCalled(SplashLoading event, Emitter<SplashState> emitter) async {
    emitter.call(SplashState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emitter.call(SplashState.success());
  }
}
