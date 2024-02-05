import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:efurniture_application/Components/CustomSVG/custom_svg.dart';
import 'package:efurniture_application/Utils/app_colours.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormField extends StatefulWidget {
  final int? maxLength;
  final String leadingIcon;
  final String hintText;
  final bool isEnable, obscureText;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? node;
  final Function? onFieldSubmit;
  final ValueChanged<String?>? onChange;
  final TextInputAction? inputAction;
  final bool? readOnly, isFilled;
  final Function()? onTap;
  final EdgeInsets? padding;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final double hintFont;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final double? suffixPadding;
  final String textFormTitle;
  final double textFormTitleFont;
  final double? valueFont;
  final double titleFormPadding;
  final List<TextInputFormatter> inputFormatters;
  final bool isDense;
  final bool showError;
  final TextAlign align;
  final TextCapitalization? textCapitalization;
  final TextStyle? textStyle, hintStyle;
  final InputBorder? inputBorder;
  final String? heading;
  final TextStyle? headingStyle;
  final bool enableCornerRadius;
  final Color? leadingIconColor;
  final bool mustFill;
  final Color? fillColor;
  final Color? textColor;
  final Iterable<String>? autofillHints;

  const CustomTextFormField({
    Key? key,
    this.maxLength,
    this.leadingIcon = "",
    this.hintText = "",
    this.obscureText = false,
    this.isEnable = true,
    this.inputType,
    this.isFilled = false,
    this.controller,
    this.node,
    this.validator,
    this.onFieldSubmit,
    this.onChange,
    this.align = TextAlign.start,
    this.inputAction,
    this.readOnly = false,
    this.onTap,
    this.padding,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines = 1,
    this.hintFont = 16.0,
    this.suffixWidget,
    this.suffixPadding = 0.0,
    this.textFormTitle = '',
    this.textFormTitleFont = 15.0,
    this.titleFormPadding = 8.0,
    this.isDense = false,
    this.showError = true,
    this.prefixWidget,
    this.valueFont,
    this.inputFormatters = const [],
    this.textCapitalization,
    this.textStyle,
    this.hintStyle,
    this.inputBorder,
    this.heading,
    this.headingStyle,
    this.enableCornerRadius = false,
    this.leadingIconColor,
    this.mustFill = true,
    this.fillColor,
    this.textColor,
    this.autofillHints,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    TextTheme appTheme = Theme.of(context).textTheme;
    ColorScheme appColorScheme = Theme.of(context).colorScheme;
    final Color textColor =
        widget.textColor ?? const Color.fromARGB(255, 2, 81, 92);
    //InputDecorationTheme textFormTheme = Theme.of(context).inputDecorationTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.heading != null)
          Container(
            margin: EdgeInsets.only(bottom: 1.h),
            child: widget.mustFill
                ? RichText(
                    text: TextSpan(
                      text: widget.heading!,
                      style: widget.headingStyle ??
                          appTheme.bodyLarge!.copyWith(
                            color: AppColours.blackButtonColor,
                          ),
                      children: const [],
                    ),
                  )
                : Text(
                    widget.heading!,
                    style: widget.headingStyle ??
                        appTheme.headlineLarge!.copyWith(
                          color: AppColours.blackButtonColor,
                        ),
                  ),
          ),
        GestureDetector(
          onTap: () {
            if (!widget.isEnable) {
              widget.onTap!();
            }
          },
          child: TextFormField(
            maxLength: widget.maxLength,
            autofillHints: widget.autofillHints,
            inputFormatters: widget.inputFormatters,
            autovalidateMode: widget.autoValidateMode,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            keyboardType: widget.inputType ?? TextInputType.name,
            obscureText: widget.obscureText && hidePass,
            textInputAction: widget.inputAction ?? TextInputAction.next,
            onFieldSubmitted: (value) => widget.onFieldSubmit,
            controller: widget.controller,
            maxLines: widget.maxLines,
            focusNode: widget.node,
            onTap: widget.onTap,
            readOnly: widget.readOnly!,
            textAlign: widget.align,
            style: widget.textStyle ??
                appTheme.bodySmall!.copyWith(
                  fontSize: widget.valueFont,
                  color:
                      widget.isEnable ? textColor : textColor.withOpacity(0.5),
                  height: 1.5,
                ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              fillColor: widget.fillColor,
              filled: widget.isFilled,
              isDense: widget.isDense,
              enabled: widget.isEnable,
              errorMaxLines: 5,
              errorStyle: !widget.showError
                  ? const TextStyle(height: 0, fontSize: 0)
                  : null,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          hidePass = !hidePass;
                        });
                      },
                      icon: hidePass
                          ? CustomSvg(
                              width: 3.w,
                              height: 3.h,
                              iconName: 'eyeOpen',
                              //color: AppColours.primaryColor,
                            )
                          : CustomSvg(
                              width: 2.w,
                              height: 2.h,
                              iconName: 'eyeClose',
                              //color: AppColours.primaryColor,
                            ),
                    )
                  : widget.suffixWidget == null
                      ? null
                      : Padding(
                          padding: EdgeInsets.all(widget.suffixPadding!),
                          child: widget.suffixWidget,
                        ),
              prefix: SizedBox(
                width:
                    widget.leadingIcon.isNotEmpty || widget.prefixWidget != null
                        ? 0
                        : 15,
              ),
              prefixIcon: widget.leadingIcon.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomSvg(
                        iconName: widget.leadingIcon,
                        height: 2.h,
                        color:
                            widget.leadingIconColor ?? appColorScheme.tertiary,
                      ),
                    )
                  : widget.prefixWidget,
              contentPadding: widget.padding ??
                  EdgeInsets.only(
                    top: widget.maxLines! > 1 ? 3.h : 0,
                  ),
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  appTheme.bodySmall!.copyWith(
                      color: AppColours.lightGreenColour, height: 1.5),
              disabledBorder: widget.inputBorder ??
                  OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 2,
                    color: AppColours.blackButtonColor.withOpacity(0.5),
                  )),
              enabledBorder: widget.inputBorder ??
                  const OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 2,
                    color: AppColours.blackButtonColor,
                  )),
              border: widget.inputBorder ??
                  const OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 2,
                    color: AppColours.blackButtonColor,
                  )),
              focusedBorder: widget.inputBorder ??
                  const OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 1,
                    color: AppColours.blackButtonColor,
                  )),
            ),
            validator: widget.validator,
            onChanged: widget.onChange,
          ),
        ),
      ],
    );
  }
}
