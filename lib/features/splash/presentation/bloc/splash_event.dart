part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashInit extends SplashEvent {
  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashEvent {
  @override
  List<Object?> get props => [];
}

class SplashSuccess extends SplashEvent {
  @override
  List<Object?> get props => [];
}

class SplashFail extends SplashEvent {
  @override
  List<Object?> get props => [];
}
