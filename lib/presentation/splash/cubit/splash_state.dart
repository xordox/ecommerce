part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class DisplaySplash extends SplashState {}
final class Authenticated extends SplashState {}
final class UnAuthenticated extends SplashState {}
