import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required TextEditingController? controller,
    required this.title,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.hint = '',
    this.contentPadding,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.showSuffixIcon = true,
    this.suffixIcon,
    this.readOnly = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.border,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController? _controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final bool showSuffixIcon;
  final Widget? suffixIcon;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? initialValue;
  final String? hint;
  final String title;
  final bool readOnly;
  final bool autoFocus;
  final TextAlign textAlign;
  final InputBorder? border;
  final TextStyle? style;
  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListen() => setState(() {});
  @override
  void initState() {
    widget._controller!.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller!.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding:
          widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        initialValue: widget.initialValue,
        controller: widget._controller,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType == TextInputType.number
            ? const TextInputType.numberWithOptions(signed: true, decimal: true)
            : widget.maxLines! > 1
                ? TextInputType.multiline
                : widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.maxLines! > 1
            ? TextInputAction.newline
            : widget.textInputAction ?? TextInputAction.next,
        autofocus: widget.autoFocus,
        textAlign: widget.textAlign,
        onChanged: widget.onChanged,
        minLines: widget.minLines,
        maxLines: (widget._controller!.text.isEmpty) ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        style: widget.style,
        validator: (String? value) =>
            widget.validator == null ? null : widget.validator!(value),
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          labelText: widget.title,
          fillColor:
              Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          hintStyle: widget.hint!.length > 15
              ? TextStyle(fontSize: 14, color: Colors.grey.shade400)
              : TextStyle(fontSize: 15, color: Colors.grey.shade400),
          suffixIcon: widget.suffixIcon ??
              ((widget._controller!.text.isEmpty ||
                      !widget.showSuffixIcon ||
                      widget.showSuffixIcon == false)
                  ? null
                  : IconButton(
                      splashRadius: 16,
                      onPressed: () => setState(() {
                        widget._controller!.clear();
                      }),
                      icon: const Icon(CupertinoIcons.clear, size: 18),
                    )),
          focusColor: Theme.of(context).primaryColor,
          // border: widget.border ?? InputBorder.none,
        ),
      ),
    );
  }
}
