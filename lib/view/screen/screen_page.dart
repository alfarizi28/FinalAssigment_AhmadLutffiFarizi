import 'package:final_assesment/view/screen/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/assigment_bloc.dart';

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssigmentBloc(),
      child: const MyView(),
    );
  }
}
