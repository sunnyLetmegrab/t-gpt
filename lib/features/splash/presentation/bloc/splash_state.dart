part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.init() = _Init;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.success() = _Sucess;
  const factory SplashState.error() = _Error;
}
