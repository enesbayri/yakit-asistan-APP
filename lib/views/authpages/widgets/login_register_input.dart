import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class LoginRegisterInput extends StatefulWidget {
  const LoginRegisterInput({
    super.key,
    required this.label,
    required this.icon,
    required this.obscureText,
    this.textController,
    required this.height,
  });
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? textController;
  final double height;

  @override
  State<LoginRegisterInput> createState() => _LoginRegisterInputState();
}

class _LoginRegisterInputState extends State<LoginRegisterInput> {
  bool? hidePassword;

  @override
  void initState() {
    super.initState();
    hidePassword = widget.obscureText;
  }

  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width * 0.65,
      height: widget.height,
      child: TextField(
        controller: widget.textController,
        obscureText:
            widget.obscureText ? (hidePassword! ? true : false) : false,
        decoration: InputDecoration(
          contentPadding: widget.obscureText
              ? const EdgeInsets.all(16)
              : const EdgeInsets.all(4),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: ColorUiHelper.appMainColor, width: 2)),
          prefixIcon: Icon(
            widget.icon,
            size: 24,
            color: ColorUiHelper.appMainColor,
          ),
          label:
              Text(widget.label, style: TextStyleHelper.myCarsSortButtonsStyle),
          labelStyle: TextStyleHelper.textInputStyle,
          suffix: widget.obscureText
              ? (hidePassword!
                  ? hideButton(Icons.remove_red_eye)
                  : hideButton(Icons.no_encryption_rounded))
              : null,
        ),
        style: TextStyleHelper.textInputStyle,
      ),
    );
  }

  IconButton hideButton(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: ColorUiHelper.appMainColor),
      onPressed: () {
        setState(() {
          hidePassword = !(hidePassword!);
        });
      },
    );
  }
}
