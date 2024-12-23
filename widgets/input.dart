import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String initialValue;
  final String? placeholder;
  final Function(String v)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
 

  const Input({
    super.key,
    this.initialValue = "",
    this.placeholder,
    this.onChanged,
    this.keyboardType,
    this.controller,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      cursorColor: Colors.black,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
     
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Color(0xFFAAAAAA),
          fontSize: 14,
        ),
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.black.withOpacity(0.1),
        //   ),
        // ),
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.black.withOpacity(0.1),
        //   ),
        // ),
      ),
    );
  }
}
