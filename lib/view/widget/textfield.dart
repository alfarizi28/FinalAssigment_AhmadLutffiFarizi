import 'package:flutter/material.dart';

import '../../bloc/assigment_bloc.dart';

class AssigmentTextField extends StatelessWidget {
  const AssigmentTextField({
    super.key,
    required this.state,
  });

  final AssigmentStateInitial state;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: state.textController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffD4D4D4))),
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        contentPadding: const EdgeInsets.all(12),
        hintText: 'Masukan nilai N',
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(
            0xffA3A3A3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffD4D4D4))),
      ),
    );
  }
}
