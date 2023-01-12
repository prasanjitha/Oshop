import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'additional_info_page_bloc.dart';
import 'additional_info_page_view.dart';

class AdditionalInfoPageProvider extends BlocProvider<AdditionalInfoPageBloc> {
  AdditionalInfoPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AdditionalInfoPageBloc(context),
          child: const AdditionalInfoPageView(),
        );
}
