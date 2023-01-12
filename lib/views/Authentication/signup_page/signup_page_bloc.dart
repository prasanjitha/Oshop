// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../theme/custom_colors.dart';
import '../../../theme/custom_text_styles.dart';
import 'signup_page_event.dart';
import 'signup_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  final TextEditingController usernameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController rePasswordTextEditingController =
      TextEditingController();
  SignUpPageBloc(BuildContext context) : super(SignUpPageState.initialState) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    on<SubmitUserDataEvent>((event, emit) async {
      emit(state.clone(isLoading: true));
      User? user = (await auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password))
          .user;

      if (user != null) {
        user.updateDisplayName(event.username);
        await firestore.collection('users').doc(auth.currentUser!.uid).set({
          "username": event.username,
          "email": event.email,
          "status": "Unavalible",
          "uid": auth.currentUser!.uid
        });
        SuccessToastMessage(
            context, "Successfully  created account, Please add your details.");
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: ((context) => AdditionalInfoPageProvider()),
        //   ),
        // );
        emit(state.clone(isLoading: false));
      } else {
        emit(state.clone(isLoading: false));
      }
    });
  }

  void SuccessToastMessage(BuildContext context, String msg) {
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        backgroundColor: CustomColors.PRIMARY,
        message: msg,
        textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
      ),
    );
  }
}
