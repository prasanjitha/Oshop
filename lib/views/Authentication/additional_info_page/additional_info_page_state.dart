import 'package:flutter/foundation.dart';

@immutable
class AdditionalInfoPageState {
  final String error;

  const AdditionalInfoPageState({
    required this.error,
  });

  static AdditionalInfoPageState get initialState {
    return const AdditionalInfoPageState(error: '');
  }

  AdditionalInfoPageState clone({
    String? error,
  }) {
    return AdditionalInfoPageState(
      error: error ?? this.error,
    );
  }
}
