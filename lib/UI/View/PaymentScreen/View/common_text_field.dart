import 'package:flutter/material.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';

import '../../../../Utils/Constants/color_constants.dart';
import '../../../../Utils/Constants/string_constants.dart';
import '../../../../Utils/common_function.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  TextEditingController? controller;
  String? initialValue;
  String hintText;
  TextInputType? textInputType;
  int? maxLines = 1;
  FormFieldValidator<String> validator;
  final TextInputFormatter? inputFormatter;
  final void Function(String?)? onChnaged;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  IconButton? suffixIconButton;
  final bool autofocus;
  final bool autocorrect;
  int? errorMaxLines = 1;

  CommonTextField(
      {Key? key,
        required this.hintText,
        this.initialValue,
        this.controller,
        this.suffixIconButton,
        this.maxLines,
        this.textInputType,
        required this.validator,
        this.inputFormatter,
        this.onChnaged,
        this.onSaved,
        this.onTap,
        this.autofocus = false,
        this.autocorrect =  false,
        this.errorMaxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autocorrect: autocorrect,
        autofocus: autofocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: initialValue,
        inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
        keyboardType: textInputType,
        enableSuggestions: false,
        maxLines: maxLines ?? 1,
        style: const TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
        ),
        cursorColor: Colors.grey.withOpacity(0.8),

        decoration: InputDecoration(
          labelText: hintText,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIconButton,
          contentPadding: const EdgeInsets.all(13),
          labelStyle: const TextStyle(decoration: TextDecoration.none),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          hintText: hintText,
          errorMaxLines: errorMaxLines,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:  BorderSide(
                color: AppColor().primaryColor(context),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:  BorderSide(
                color: AppColor().onPrimaryContainerColor(context),
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:  BorderSide(
                color: AppColor().primaryColor(context),
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:  const BorderSide(
                color: AppColor.bgRedClr
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppColor.bgRedClr

              )),
        ),
        onChanged: onChnaged,
        onSaved: onSaved,
        onTap: onTap,
      ),
    );
  }
}
