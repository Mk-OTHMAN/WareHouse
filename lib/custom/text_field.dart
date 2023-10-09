import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const CustomTextField({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Empty';
          }
          return null;
        },
        controller: textEditingController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: const InputDecoration(
          hintText: 'Enter Number',
          labelText: 'Enter Number',
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          )),
        ));
  }
}
