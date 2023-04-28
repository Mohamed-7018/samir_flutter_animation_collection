import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/core/utils/values.dart';
import 'package:samir_flutter_ui_challenge/challenge_2_Teddy_animated_login_cubit/view/widgets/registeration/input_animator.dart';

typedef CaretMoved = void Function(Offset? globalCaretPosition);
typedef TextChanged = void Function(String text);

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  const TrackingTextInput({
    Key? key,
    this.onCaretMoved,
    this.onTextChanged,
    this.hint,
    this.label,
    required this.onEditingComplete,
    required this.focusNode,
    required this.textInputAction,
    required this.changed,
    required this.controller,
    this.suffixIcon,
    required this.prefixIcon,
    this.fillColor,
    this.borderRadius = GlobalAppSizes.s_60,
    this.textInputType,
    this.borderColor,
    required this.suggerstion,
    this.enabled = true,
    this.prefixIconColor,
    required this.isObscured,
  }) : super(key: key);
  final CaretMoved? onCaretMoved;
  final TextChanged? onTextChanged;
  final String? hint;
  final String? label;
  final bool isObscured;
  final VoidCallback onEditingComplete;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Function changed;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Color? fillColor;
  final double? borderRadius;
  final TextInputType? textInputType;
  final Color? borderColor;
  final bool suggerstion;
  final bool enabled;

  @override
  TrackingTextInputState createState() => TrackingTextInputState();
}

class TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  // final TextEditingController _textController = TextEditingController();
  Timer? _debounceTimer;
  @override
  initState() {
    widget.controller.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject? fieldBox =
              _fieldKey.currentContext?.findRenderObject();
          var caretPosition =
              fieldBox is RenderBox ? getCaretPosition(fieldBox) : null;

          widget.onCaretMoved?.call(caretPosition);
        }
      });
      widget.onTextChanged?.call(widget.controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: TextFormField(
          key: _fieldKey,
          enabled: widget.enabled,
          style: GlobalAppStyles.googleFontsGenerator(context,
              color: Colors.black),
          controller: widget.controller,
          focusNode: widget.focusNode,
          onEditingComplete: widget.onEditingComplete,
          enableSuggestions: widget.suggerstion,
          obscureText: widget.isObscured,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType ?? TextInputType.text,
          decoration: InputDecoration(
            contentPadding: GlobalAppEdgeInsets.sh_10v_16,
            // const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            hintText: widget.hint,
            labelText: widget.label,
            filled: true,
            fillColor: widget.fillColor,
            hintStyle: const TextStyle(color: Colors.grey),
            labelStyle: const TextStyle(
                color: GlobalAppColors.kScaffoldDark, fontSize: 18),
            prefixIcon: Icon(widget.prefixIcon, color: widget.prefixIconColor),
            suffixIcon: widget.suffixIcon ?? const SizedBox(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
            ),

            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(widget.borderRadius!),
            //   //borderSide: BorderSide.none,
            // ),
          ),
        )

        // TextFormField(
        //     decoration: InputDecoration(
        //       hintText: widget.hint,
        //       labelText: widget.label,
        //     ),
        //     key: _fieldKey,
        //     controller: _textController,
        //     obscureText: widget.isObscured,
        //     validator: (value) {}),
        );
  }
}
