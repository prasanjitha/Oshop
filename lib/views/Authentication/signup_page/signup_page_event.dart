import 'package:flutter/foundation.dart';

@immutable
abstract class SignUpPageEvent {}

class SubmitUserDataEvent extends SignUpPageEvent {
  final String username;
  final String email;
  final String password;
  final String repsd;

  SubmitUserDataEvent({
    required this.email,
    required this.username,
    required this.password,
    required this.repsd,
  });
}
