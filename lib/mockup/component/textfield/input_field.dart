import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/constant_colors.dart';
import '../../constants/constant_images.dart';
import '../../constants/constant_spacing.dart';
import '../../utils/image_in_assets.dart';

enum InputFieldState {
  normal,
  correct,
  wrong,
}

abstract class InputFieldDelegate {
  inputFieldTextDidChanged(InputField inputField, String value);
  inputFieldTextDidEndEditing(InputField inputField, String value);
  bool inputFieldShouldChangedText(InputField inputField, String newValue);
  InputFieldState inputFieldStateOfChangedText(InputField inputField, String newValue);
}

class InputField extends StatefulWidget {
  final String text;
  final int maxLength;
  final TextStyle textStyle;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String placeHolderText;
  final Widget prefixView;
  final Widget suffixView;
  final Widget hintView;
  final bool obscureMode;
  final InputFieldDelegate delegate;

  InputFieldState inputState;

  Image _iconCorrect = ImageInAssets(name: Images.validation_tick).image();
  Image _iconWrong = ImageInAssets(name: Images.error_exclaimation_mark).image(color: Colours.red);

  InputField({
    Key key,
    this.placeHolderText = "",
    this.text = "",
    this.prefixView,
    this.suffixView,
    this.hintView,
    this.obscureMode = false,
    @required this.delegate,
    this.textStyle,
    this.maxLength = -1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputState = InputFieldState.normal,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState(new TextEditingController(text: text));
}

class _InputFieldState extends State<InputField> {
  final TextEditingController _controller;
  String _oldValue = "";
  FocusNode _focus;

  _InputFieldState(this._controller) {
    this._focus = FocusNode();
    this._controller.addListener(_textFieldWatcher);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this._controller.dispose();
    super.dispose();
  }

  void _textFieldWatcher() {
    String newValue = this._controller.text;
    if (newValue == _oldValue) {
      return;
    }

    if (null == this.widget.delegate) {
      return;
    }

    if (false == this.widget.delegate.inputFieldShouldChangedText(this.widget, newValue)) {
      this._controller.text = this._oldValue;
      this._controller.selection = TextSelection(baseOffset: this._oldValue.length, extentOffset: this._oldValue.length);
      return;
    }

    this.widget.delegate.inputFieldTextDidChanged(this.widget, newValue);
    _oldValue = newValue;

    var newState = this.widget.delegate.inputFieldStateOfChangedText(this.widget, newValue);
    if (newState != this.widget.inputState) {
      setState(() {
        this.widget.inputState = newState;
      });
    }
  }

  void _textFieldDidEndEditing(BuildContext context, String value) {
    if (null == this.widget.delegate) {
      return;
    }

    if (true == this.widget.delegate.inputFieldShouldChangedText(this.widget, value)) {
      this._oldValue = value;
    }

    this.widget.delegate.inputFieldTextDidEndEditing(this.widget, value);
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> prefixIcon = List<Widget>();
    List<Widget> suffixIcon = List<Widget>();
    Widget externalHint = SizedBox(height: 20);
    bool error = this.widget.inputState == InputFieldState.wrong;
    bool normal = this.widget.inputState == InputFieldState.normal;
    Color color = error ? Colours.red : Colours.dark;

    if (this.widget.inputState == InputFieldState.wrong) {
      externalHint = (this.widget.hintView != null ? this.widget.hintView : SizedBox(height: 20));
    }

    if (this.widget.prefixView != null) {
      prefixIcon.add(this.widget.prefixView);
    }

    if (this.widget.suffixView != null) {
      suffixIcon.add(this.widget.suffixView);
    } else {
      if (false == normal) {
        suffixIcon.add(error ? this.widget._iconWrong : this.widget._iconCorrect);
      }
    }

    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            focusNode: this._focus,
            style: this.widget.textStyle,
            controller: this._controller,
            keyboardType: this.widget.keyboardType,
            textInputAction: this.widget.textInputAction,
            onEditingComplete: () => _textFieldDidEndEditing(context, this._oldValue),
            onSubmitted: (value) => _textFieldDidEndEditing(context, value),
            obscureText: this.widget.obscureMode,
            decoration: InputDecoration(
              prefixIcon: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.center,
                children: prefixIcon,
              ),
              suffixIcon: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: suffixIcon,
              ),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: Spacing.xxxs, color: color)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: Spacing.xxxs, color: color)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: Spacing.xxxs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                externalHint,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
