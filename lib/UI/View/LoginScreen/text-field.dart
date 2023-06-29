import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Utils/Constants/color_constants.dart';
import '../../../Utils/Constants/string_constants.dart';
import '../../../Utils/Constants/text_style_constant.dart';

class TextFieldsWithValidation extends StatelessWidget {
  TextEditingController? controller;
  String? initialValue;
  String hintText;
  TextInputType? textInputType;
  int? maxLines;
  EdgeInsets padding;
  FormFieldValidator<String> validator;
  final TextInputFormatter? inputFormatter;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  IconButton? suffixIcon;
  final bool autofocus;
  int errorMaxLines;
  double borderRadius;
  TextInputAction textInputAction;
  Icon? prefixIcon;
  bool obscureText;
  AutovalidateMode? autoValidateMode;

  TextFieldsWithValidation(
      {Key? key,
      required this.hintText,
      this.initialValue,
      this.controller,
      this.suffixIcon,
      this.textInputAction = TextInputAction.done,
      this.maxLines = 1,
      this.padding = const EdgeInsets.all(8.0),
      this.textInputType,
      required this.validator,
      this.inputFormatter,
      this.onChanged,
      this.onSaved,
      this.onTap,
      this.autofocus = false,
      this.errorMaxLines = 1,
      this.prefixIcon,
      this.obscureText = false,
        this.borderRadius = 10,
      this.autoValidateMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Padding(
      padding: padding,
      child: TextFormField(
        obscureText: obscureText,
        textInputAction: textInputAction,
        autofocus: autofocus,
        autovalidateMode: autoValidateMode,
        initialValue: initialValue,
        controller: controller,
        validator: validator,
        inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
        keyboardType: textInputType,
        enableSuggestions: false,
        autocorrect: false,
        maxLines: maxLines,
        onChanged: onChanged,
        onSaved: onSaved,
        onTap: onTap,
        style: AppTxtStyle().normalStyle(context),
        cursorColor: AppColor().primaryColor(context),
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorMaxLines: errorMaxLines,
          contentPadding: EdgeInsets.all(13),
          fillColor: AppColor().canvasColor(context),
          errorStyle:AppTxtStyle().errorTextStyle(context),
          labelStyle: AppTxtStyle().labelTextStyle(context),
          hintStyle: AppTxtStyle().hintTextStyle(context),
          enabledBorder: outlineInputBorder(AppColor().primaryColor(context),borderRadius),
          focusedBorder: outlineInputBorder(AppColor().onPrimaryContainerColor(context),borderRadius),
          disabledBorder: outlineInputBorder(AppColor().disabledColor(context),borderRadius),
          errorBorder: outlineInputBorder(AppColor().errorColor(context),borderRadius),
          focusedErrorBorder:outlineInputBorder(AppColor().errorColor(context),borderRadius),
        ),
      ),
    );
  }
}

outlineInputBorder(Color color,double borderRadius,{double? width}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: width ?? 1.5));
}

class Validator {
  static emptyValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == "") {
      return AppStrings.emptyFieldTxt;
    }
    return null;
  }

  static emailValidation(String? value) {
    RegExp regex = RegExp(
        r'^[_A-Za-z0-9-+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})\$*(\s?)');
    var emailNonNullValue = value ?? "";
    if (emailNonNullValue.isEmpty || emailNonNullValue.trim() == "") {
      return (AppStrings.emptyFieldTxt);
    } else if (!regex.hasMatch(emailNonNullValue)) {
      return (AppStrings.emailNotCorrectTxt);
    }
    return null;
  }

  static passwordValidation(String? value) {
    // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty || passNonNullValue.trim() == "") {
      return (AppStrings.emptyFieldTxt);
    } else if (passNonNullValue.length < 8) {
      return (AppStrings.passwordLengthCheckTxt);
    }
    /*else if (!regex.hasMatch(passNonNullValue)) {
      return (AppStrings.pwdCheckTxt);
    }*/
    return null;
  }
  static confirmPasswordValidation(String? value,String? pwd) {
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty || passNonNullValue.trim() == "") {
      return (AppStrings.emptyFieldTxt);
    } else if (passNonNullValue != pwd) {
      return (AppStrings.pwdCheckTxt);
    }
    return null;
  }

  static contactNumberValidation(String? value) {
    RegExp regex = RegExp( r'(^(?:[+0]9)?[0-9]{10,12}$)');
    var contactVal = value ?? "";
    if (contactVal.isEmpty || contactVal.trim() == "") {
      return (AppStrings.emptyFieldTxt );
    } else if (contactVal.length < 8) {
      return (AppStrings.contactChkTxt);
    }
  else if (!regex.hasMatch(value!)) {
  return AppStrings.validContactChkTxt;
  }
    return null;
  }
}
