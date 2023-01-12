import 'package:flutter/foundation.dart';

@immutable
class SignUpPageState {
  final bool isLoading;

  const SignUpPageState({
    required this.isLoading,
  });

  static SignUpPageState get initialState {
    return const SignUpPageState(isLoading: false);
  }

  SignUpPageState clone({
    bool? isLoading,
  }) {
    return SignUpPageState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
