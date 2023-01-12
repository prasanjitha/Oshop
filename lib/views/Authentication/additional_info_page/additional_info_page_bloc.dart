import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'additional_info_page_event.dart';
import 'additional_info_page_state.dart';

class AdditionalInfoPageBloc
    extends Bloc<AdditionalInfoPageEvent, AdditionalInfoPageState> {
  AdditionalInfoPageBloc(BuildContext context)
      : super(AdditionalInfoPageState.initialState);
}
